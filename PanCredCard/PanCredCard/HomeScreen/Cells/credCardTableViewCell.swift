//
//  credCardTableViewCell.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class credCardTableViewCell: UITableViewCell {
    
    var viewModel: CredCardViewModel = CredCardViewModel()
    
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var nameCreditCardLabel: UILabel!
    @IBOutlet weak var numberCreditCardLabel: UILabel!
    @IBOutlet weak var credCardImageView: UIImageView!
    
    static let identifier: String = String(describing: credCardTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }

    func configElements() {
        subView.backgroundColor = .white
        nameCreditCardLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
    }
    
    func setupCell(data: Card) {
        nameCreditCardLabel.text = data.name
        numberCreditCardLabel.text = viewModel.maskCreditCardNumber(number: data.number)
//        credCardImageView.image = data.image
    }
    
    
}
