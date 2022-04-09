//
//  GroupsViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let cellIdent = "groupCell"
    
    var groupsArray = User.info.groups
    

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
        
        tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: cellIdent)
    }
    
    @objc func onClickFindGroupBarButtonItem() {
        let allGroupTableViewController = AllGroupsTableViewController()
        
        allGroupTableViewController.clouser = { [weak self] gr in
            self?.groupsArray.append(gr)
            self?.tableView.reloadData()
        }
        allGroupTableViewController.groupUser = groupsArray
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
        return groupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdent, for: indexPath) as? FriendsAndGroupTableViewCell

        cell?.nameLabel.text = ("\(groupsArray[indexPath.row].name)")
        
        cell?.avatarCustomView.profileImageView.image = UIImage(named: groupsArray[indexPath.row].avatar.photo)
        
        return cell ?? UITableViewCell()
    }
    
}

// MARK: - Table view delegate
extension GroupsTableViewController {
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Отписаться") { _, _, complete in
                self.groupsArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                complete(true)
            }
            
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
