//
//  HoleTableViewController.swift
//  Hole
//
//  Created by Alexey Mikhailov on 07.06.2021.
//

import UIKit

class HoleTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! { didSet { configureTableView() } }
    
    private func configureTableView() {
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerNib(with: HoleTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.setBackgroundGradient()
    }
    
}

extension HoleTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 40 }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let holeCell = cell as? HoleTableViewCell {
            holeCell.layoutIfNeeded()
            holeCell.makeHole()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HoleTableViewCell.identifier) as! HoleTableViewCell
        cell.configureText(by: indexPath.row)
        return cell
    }
}



