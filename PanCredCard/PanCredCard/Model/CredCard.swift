//
//  CredCard.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 08/02/24.
//

import Foundation


// MARK: - CredCard
struct CredCard: Codable {
    var cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    var id: Int
    var name, alias: String
    var credit, debit: Bool
    var number, codSEC, image: String

    enum CodingKeys: String, CodingKey {
        case id, name, alias, credit, debit, number
        case codSEC = "codSec"
        case image
    }
}
