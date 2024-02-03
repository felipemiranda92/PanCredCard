//
//  ViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    @IBAction func pressedEnterButton(_ sender: UIButton) {
        
        let homeScreen = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        navigationController?.pushViewController(homeScreen ?? UIViewController(), animated: true)
    }
    
    func configElements() {
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.tintColor = UIColor.gray
    }
}

