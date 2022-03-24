//
//  MainViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let tabBar = UITabBarController()
    
    let masCell = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    let cellIndetifier = "friendsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainTableViewController()
    }
}

extension FriendsTableViewController {
    
    func setupMainTableViewController() {
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndetifier)
        
        self.navigationItem.title = "Друзья"
        setupTabBar()
    }
    
    func setupTabBar() {
        let tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person.3.fill"), tag: 0)
        self.tabBarItem = tabBarItem
    }
    
}

// MARK: - Table view data source
extension FriendsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masCell.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath)

        cell.textLabel?.text = ("Друг - \(masCell[indexPath.row])")

        return cell
    }
    
}

// MARK: - Table Delegate
extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let detailFriendsCollectionViewController = DetailFriendsCollectionViewController(collectionViewLayout: layout)
        detailFriendsCollectionViewController.titleDetail = tableView.cellForRow(at: indexPath)?.textLabel?.text
        navigationController?.pushViewController(detailFriendsCollectionViewController, animated: true)
    }
    
}
