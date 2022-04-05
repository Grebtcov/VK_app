//
//  AllGroupsTableViewController.swift
//  VK_app
//
//  Created by Alex x on 3/24/22.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let cellIdent = "cell"
    let allGroupsArray = Frends.masAllGroups
    var groupUser: [GroupModel]?
    var clouser: ((GroupModel) -> ())?

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
        tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: cellIdent)
        
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
        return allGroupsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent, for: indexPath) as? FriendsAndGroupTableViewCell

        cell?.nameLabel.text = ("\(allGroupsArray[indexPath.row].name)")
        
        cell?.profileImageView.image = UIImage(named: allGroupsArray[indexPath.row].avatar.photo)
        
        return cell ?? UITableViewCell()
    }
    
}

// MARK: - Table view delegate
extension AllGroupsTableViewController {
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let groups = groupUser else {return nil}
        
        var isSubscribe = false
        
        for gr in groups where gr.name == allGroupsArray[indexPath.row].name {
            isSubscribe = true
        }
        
        if !isSubscribe {
            let addAction = UIContextualAction(style: .normal, title: "подписаться") { _, _, complete in
                
                let group = self.allGroupsArray[indexPath.row]
                self.clouser?(group)
                self.groupUser?.append(group)
                complete(true)
            }
            addAction.backgroundColor = .systemBlue
            let configuration = UISwipeActionsConfiguration(actions: [addAction])
            configuration.performsFirstActionWithFullSwipe = true
            return configuration
        }
        
        
        
        return nil
    }
}
