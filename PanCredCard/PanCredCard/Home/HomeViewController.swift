//
//  HomeViewController.swift
//  PanCredCard
//
//  Created by Felipe Miranda Santos on 23/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var listCredCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: credCardTableViewCell.identifier, for: indexPath) as? credCardTableViewCell
        return cell ?? UITableViewCell()
    }
    
    
}
