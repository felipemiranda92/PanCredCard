//
//  CredCardViewModel.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 08/02/24.
//

import Foundation
import UIKit
import AudioToolbox

class CredCardViewModel {
    
    private var service = CredCardService()
    private var credCard: CredCard?
    private let service_keyChain = "PanCredCard"
    
    func fetchCredCard() {
        service.getCredCardMock { result in
            switch result {
            case .success(let success):
                credCard = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return credCard?.cards.count ?? 0
    }
    
    func getCards(indexPath: IndexPath) -> Card {
        return credCard?.cards[indexPath.row] ?? Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSEC: "", image: "")
    }
    
    func maskCreditCardNumber(number: String) -> String {
        guard number.count >= 4 else {
            return "Número inválido"
        }
        
        let lastFourDigits = String(number.suffix(4))
        let maskedDigits = String(repeating: "*", count: number.count - 4)
        
        return maskedDigits + lastFourDigits
    }
    
    func loadImageForCard(imageHex: String) -> Data? {
        
        guard let imageData = Data(base64Encoded: imageHex, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        return imageData
    }
    
    func saveCardNumber(cardNumber: String, forCardID cardID: Int) {
        guard let data = cardNumber.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service_keyChain,
            kSecAttrAccount as String: "\(cardID)",
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func loadCardNumber(forCardID cardID: Int) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service_keyChain,
            kSecAttrAccount as String: "\(cardID)",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let data = result as? Data else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func deleteCardNumber(forCardID cardID: Int) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service_keyChain,
            kSecAttrAccount as String: "\(cardID)"
        ]
        
        SecItemDelete(query as CFDictionary)
    }
    
    func accessibility() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        
        AudioServicesPlaySystemSound(SystemSoundID(1104))
    }

    
    
}

