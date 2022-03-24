//
//  AllGroupsTableViewController.swift
//  VK_app
//
//  Created by Alex x on 3/24/22.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let masGroup = [1,2,3,4,5]
    let cellIdent = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainTableViewController()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Setup
extension AllGroupsTableViewController {
    
    func setupMainTableViewController() {
        navigationItem.title = "Поиск групп"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdent)
        
    }
    
}

// MARK: - Table view data source
extension AllGroupsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent, for: indexPath)

        cell.textLabel?.text = "Группа - \(masGroup[indexPath.row])"

        return cell
    }
    
}
