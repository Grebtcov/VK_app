//
//  AllGroupsTableViewController.swift
//  VK_app
//
//  Created by Alex x on 3/24/22.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    private let searchBar = UISearchBar()
    
    let cellIdent = "cell"
    var allGroupsArray: [GroupModel] = []

    private lazy var tapHideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    

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
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left

        view.addGestureRecognizer(edgePan)
        
        
        tableView.tableHeaderView = searchBar
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.heightAnchor.constraint(equalToConstant: 34).isActive = true
        searchBar.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        searchBar.delegate = self
    }

    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
                popViewController()
        }
    }
    
    @objc func back() {
        popViewController()
    }
    
    func popViewController() {
        let navigationControllerDelegate = NavigationControllerDelegate()
        navigationController?.delegate = navigationControllerDelegate
        
        navigationController?.popViewController(animated: true)
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
        cell?.avatarCustomView.set(imageURL: allGroupsArray[indexPath.row].photo50)
        
        return cell ?? UITableViewCell()
    }
    
}

// MARK: - Table view delegate
extension AllGroupsTableViewController {
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if allGroupsArray[indexPath.row].isMember == 0 {
            let addAction = UIContextualAction(style: .normal, title: "подписаться") { _, _, complete in
                
                
//                FirebaseService.shared.saveGroupUser(userId: Session.shared.userId, groupId: self.allGroupsArray[indexPath.row].id)
                
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

// MARK: - Table SearchBarDelegate
extension AllGroupsTableViewController: UISearchBarDelegate {
    
    @objc func hideKeyboard() {
            self.view.endEditing(true)
        }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapHideKeyboardGestureRecognizer)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapHideKeyboardGestureRecognizer)
    }
    
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
               //isSearch = false
        }
    
        
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchText.count == 0 {
               // isSearch = false
              //  groupIdFriendsInAlphabetical(frendsArray)
                self.allGroupsArray = []
                tableView.reloadData()
            } else {
               // isSearch = true
//                filteredfrendsArray = frendsArray.filter({ (friend: FriendModel) -> Bool in
//
//                    return friend.lastName.lowercased().contains(searchText.lowercased())
//                })
//                groupIdFriendsInAlphabetical(filteredfrendsArray)
                
                GroupNetworkService.getGroupSearch(search: searchText) { groups in
                    
                    DispatchQueue.main.async {
                        self.allGroupsArray = groups
                        self.tableView.reloadData()
                    }
                    
                }
                
                
            }
        }
    
    
}
