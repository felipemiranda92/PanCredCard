//
//  ViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 16/02/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var credCardNameLabel: UILabel!
    @IBOutlet weak var credCardAliasLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var credCardDebitLabel: UILabel!
    @IBOutlet weak var credCardNumberLabel: UILabel!
    @IBOutlet weak var credCardCodSecLabel: UILabel!
    
    var viewModel: DetailsViewModel = DetailsViewModel()
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
        credCardNameLabel.text = creditCard?.alias
        credCardNameLabel.isAccessibilityElement = true
        credCardNameLabel.accessibilityHint = "Esta é a bandeira do cartão selecionado"
        
        
        if let creditCard = creditCard {
            creditLabel.text = viewModel.configureCreditLabel(creditCard: creditCard)
            creditLabel.isAccessibilityElement = true
            creditLabel.accessibilityHint = "Essa é a função de crédito"
            
            credCardDebitLabel.text = viewModel.configureDebitLabel(creditCard: creditCard)
            credCardDebitLabel.isAccessibilityElement = true
            credCardDebitLabel.accessibilityHint = "Essa é a função de débito"
        }
        
        credCardNumberLabel.text = creditCard?.number
        credCardNumberLabel.isAccessibilityElement = true
        credCardNumberLabel.accessibilityHint = "Esse é o número do cartão"
        
        credCardCodSecLabel.text = creditCard?.codSEC
        credCardCodSecLabel.isAccessibilityElement = true
        credCardCodSecLabel.accessibilityHint = "Esse é o código do cartão"
    }
}

