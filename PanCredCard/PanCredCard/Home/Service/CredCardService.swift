//
//  CredCardService.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 08/02/24.
//

import Foundation


class CredCardService {
    
    func getCredCardMock(completion: (Result<CredCard, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: "CredCard", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let credCard: CredCard = try JSONDecoder().decode(CredCard.self, from: data)
                completion(.success(credCard))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
}
