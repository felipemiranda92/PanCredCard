//
//  detailsViewModel.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 22/02/24.
//

import Foundation

class detailsViewModel {
    
    func configureCreditLabel(creditCard: Card) -> String {
        if creditCard.credit == true {
            return  "Função crédito ativa"
        } else {
            return  "Função crédito inativa"
        }
    }
    
    func configureDebitLabel(creditCard: Card) -> String {
        if creditCard.credit == true {
            return  "Função débito ativa"
        } else {
            return  "Função débito inativa"
        }
    }
    
}
