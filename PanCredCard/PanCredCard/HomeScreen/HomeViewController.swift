//
//  HomeViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: CredCardViewModel = CredCardViewModel()
    
    @IBOutlet weak var listCredCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCredCard()
        configListCredCardTableView()
    }
    
    func configListCredCardTableView() {
        listCredCardTableView.delegate = self
        listCredCardTableView.dataSource = self
        listCredCardTableView.register(credCardTableViewCell.nib(), forCellReuseIdentifier: credCardTableViewCell.identifier)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: credCardTableViewCell.identifier, for: indexPath) as? credCardTableViewCell
        cell?.setupCell(data: viewModel.getCards(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCard = viewModel.getCards(indexPath: indexPath)
        viewModel.saveCardNumber(cardNumber: selectedCard.number, forCardID: selectedCard.id)
        
        let detailsScreen = UIStoryboard(name: String(describing: detailsViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: detailsViewController.self)) { coder -> detailsViewController? in
            return detailsViewController(coder: coder, creditCard: self.viewModel.getCards(indexPath: indexPath))
        }
        
        viewModel.accessibility()
        navigationController?.pushViewController(detailsScreen , animated: true)
        
    }
    
}
