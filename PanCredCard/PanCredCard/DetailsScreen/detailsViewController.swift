//
//  ViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 16/02/24.
//

import UIKit

class detailsViewController: UIViewController {
    
    @IBOutlet weak var credCardNameLabel: UILabel!
    @IBOutlet weak var credCardAliasLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var credCardDebitLabel: UILabel!
    @IBOutlet weak var credCardNumberLabel: UILabel!
    @IBOutlet weak var credCardCodSecLabel: UILabel!
    
    
    var creditCard: Card?
    
    
    init?(coder: NSCoder, creditCard: Card) {
        self.creditCard = creditCard
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
        
    }
    
    func setupDetails() {
        
        credCardNameLabel.text = creditCard?.name
        credCardAliasLabel.text = creditCard?.alias
        
        if let creditCard = creditCard {
            creditLabel.text = configureCreditLabel(creditCard: creditCard)
        }
        
        if let creditCard = creditCard {
            credCardDebitLabel.text = configureDebitLabel(creditCard: creditCard)
        }
        credCardNumberLabel.text = creditCard?.number
        credCardCodSecLabel.text = creditCard?.codSEC
    }
}


extension detailsViewController {
    
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
