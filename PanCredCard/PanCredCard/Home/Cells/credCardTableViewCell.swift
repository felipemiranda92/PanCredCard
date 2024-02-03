//
//  credCardTableViewCell.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class credCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var nameCreditCardLabel: UILabel!
    @IBOutlet weak var numberCreditCardLabel: UILabel!
    @IBOutlet weak var credCardImageView: UIImageView!
    
    static let identifier: String = "credCardTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }

    func configElements() {
        
        subView.backgroundColor = .white
        
        nameCreditCardLabel.text = "American Express"
        nameCreditCardLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        numberCreditCardLabel.text = "12312412412"
        
    }
    
    func setupCell() {
        
    }
    
}
