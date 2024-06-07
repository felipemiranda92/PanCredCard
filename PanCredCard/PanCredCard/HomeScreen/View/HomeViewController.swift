//
//  HomeViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: CredCardViewModel = CredCardViewModel()
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listCredCardTableView: UITableView!
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configListCredCardTableView()
        configElements()
        configSearchBar()
        setupActivityIndicator()
        showLoading()
        viewModel.fetchCredCard {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.hideLoading()
                self.listCredCardTableView.reloadData()
            }
        }
    }
    
    func configListCredCardTableView() {
        listCredCardTableView.delegate = self
        listCredCardTableView.dataSource = self
        listCredCardTableView.register(CredCardTableViewCell.nib(), forCellReuseIdentifier: CredCardTableViewCell.identifier)
        
    }
    
    func configSearchBar() {
        searchBar.delegate = self
    }
    
    func configElements() {
        logoLabel.text = "PanCredCard"
        logoLabel.font = UIFont.boldSystemFont(ofSize: 30)
        logoLabel.textAlignment = .center
        logoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        listCredCardTableView.separatorStyle = .singleLine
        listCredCardTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        searchBar.searchBarStyle = .minimal
    }
    
    private func setupActivityIndicator() {
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            view.addSubview(activityIndicator)
        }
        
        private func showLoading() {
            activityIndicator.alpha = 0.0
            activityIndicator.startAnimating()
            UIView.animate(withDuration: 0.3) {
                self.activityIndicator.alpha = 1.0
            }
        }
        
        private func hideLoading() {
            UIView.animate(withDuration: 0.3, animations: {
                self.activityIndicator.alpha = 0.0
            }) { _ in
                self.activityIndicator.stopAnimating()
            }
        }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CredCardTableViewCell.identifier, for: indexPath) as? CredCardTableViewCell
        cell?.setupCell(data: viewModel.getCards(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoading()
        
        let selectedCard = viewModel.getCards(indexPath: indexPath)
        viewModel.saveCardNumber(cardNumber: selectedCard.number, forCardID: selectedCard.id)
        
        let detailsScreen = UIStoryboard(name: String(describing: DetailsViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: DetailsViewController.self)) { coder -> DetailsViewController? in
            return DetailsViewController(coder: coder, creditCard: self.viewModel.getCards(indexPath: indexPath))
        }
        
        viewModel.accessibility()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hideLoading() // Esconder o indicador de carregamento
            self.navigationController?.pushViewController(detailsScreen, animated: true)
        }
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCards(searchText: searchText)
        listCredCardTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.filterCards(searchText: searchBar.text ?? "")
        listCredCardTableView.reloadData()
    }
}
