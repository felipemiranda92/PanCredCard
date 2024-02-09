//
//  CredCardViewModel.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 08/02/24.
//

import Foundation

class CredCardViewModel {
    
    
    private var service = CredCardService()
    private var credCard: CredCard?
    
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
    
}
