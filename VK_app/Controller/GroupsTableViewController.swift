//
//  GroupsViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let cellIdent = "groupCell"
    let masCell = [1,2,3,4,5]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainTableViewController()
    }
}

// MARK: - Setup
extension GroupsTableViewController {
    
    func setupMainTableViewController() {
        view.backgroundColor = .white
        
        setupTabBar()
        setupNavigation()
    }
    
    func setupTabBar() {
        let tabBarItem = UITabBarItem(title: "Группы", image: UIImage(systemName: "rectangle.3.group.fill"), tag: 1)
        self.tabBarItem = tabBarItem
    }
    
    func setupNavigation() {
        self.navigationItem.title = "Группы"
        
        let findGroupBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(onClickFindGroupBarButtonItem))
        navigationItem.setRightBarButton(findGroupBarButtonItem, animated: true)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdent)
    }
    
    @objc func onClickFindGroupBarButtonItem() {
        let allGroupTableViewController = AllGroupsTableViewController()
        navigationController?.pushViewController(allGroupTableViewController, animated: true)
    }
    
}



// MARK: - Table view data source
extension GroupsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masCell.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent, for: indexPath)

        cell.textLabel?.text = "Группа - \(masCell[indexPath.row])"

        return cell
    }
    
}
