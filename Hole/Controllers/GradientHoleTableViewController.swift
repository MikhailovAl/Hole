//
//  GradientHoleTableViewController.swift
//  Hole
//
//  Created by Alexey Mikhailov on 08.06.2021.
//

import UIKit

class GradientHoleTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! { didSet { configureTableView() } }
    
    private func configureTableView() {
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerNib(with: GradientHoleTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.setBackgroundGradient()
    }
    
}

extension GradientHoleTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 40 }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let gradienHoleCell = cell as? GradientHoleTableViewCell {
            gradienHoleCell.layoutIfNeeded()
            gradienHoleCell.applyGradientPattern()
            gradienHoleCell.makeHole()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GradientHoleTableViewCell.identifier) as! GradientHoleTableViewCell
        cell.configureText(by: indexPath.row)
        return cell
    }
}




