//
//  MainViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController {
    
    var frendsArray: [FriendModel] = []
    let cellIndetifier = "friendsCell"
    var realmNotification: NotificationToken?
    private let searchBar = UISearchBar()
    
    private var dicGroupIdFriendsInAlphabetical: [String:[Int]] = [:]
    private var masAlphabetical: [String] = []
    private var filteredfrendsArray: [FriendModel] = []
    private var isSearch = false
    
    private lazy var tapHideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    private let startColorGradient = UIColor.white
    private let endColorGradient = UIColor.systemBlue

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isUserInteractionEnabled = true
        realmNotification = RealmService.shared.makeObserver(RealmFriend.self, completion: {
            DataService.shared.loadFriends { friends in

                DispatchQueue.main.async {
                    self.frendsArray = friends
                    self.groupIdFriendsInAlphabetical(self.frendsArray)
                    self.tableView.reloadData()
                }
            }
        })
        
        
        setupMainTableViewController()
       
    }
    
}

extension FriendsTableViewController {
    
    func groupIdFriendsInAlphabetical(_ mas:[FriendModel] ) {
        masAlphabetical = []
        dicGroupIdFriendsInAlphabetical = [:]
       // var dicResult: [String:[Int]] = [:]
        
        for (i,friend) in mas.enumerated() {
            if let firstCharLastName = friend.lastName.first {
            
            if dicGroupIdFriendsInAlphabetical[String(firstCharLastName)] == nil {
                dicGroupIdFriendsInAlphabetical[String(firstCharLastName)] = []
                dicGroupIdFriendsInAlphabetical[String(firstCharLastName)]?.append(i)
                masAlphabetical.append(String(firstCharLastName))
            } else {
                dicGroupIdFriendsInAlphabetical[String(firstCharLastName)]?.append(i)
            }
            }
        }
        
        masAlphabetical = masAlphabetical.sorted(by: {$0 < $1})
        print("Ура")
       // return dicResult
    }
    
    func setupMainTableViewController() {
        view.backgroundColor = .white
        
        tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: cellIndetifier)
        
        self.navigationItem.title = "Друзья"
        
        tableView.tableHeaderView = searchBar
       // searchBar.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        
        
        tableView.tableHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView?.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.heightAnchor.constraint(equalToConstant: 34).isActive = true
        searchBar.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        searchBar.delegate = self
       
        self.tableView.tableHeaderView?.layoutIfNeeded()
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
        
        //view.addGestureRecognizer(tapHideKeyboardGestureRecognizer)
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person.3.fill"), tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    @objc func hideKeyboard() {
            self.view.endEditing(true)
        }
}

// MARK: - Table view data source
extension FriendsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return masAlphabetical.count
        //return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dicGroupIdFriendsInAlphabetical[masAlphabetical[section]]?.count ?? 0
        //return frendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(masAlphabetical[section])"
    }
    
    
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as? FriendsAndGroupTableViewCell else {
            return UITableViewCell()
        }
        
        guard let index = dicGroupIdFriendsInAlphabetical[masAlphabetical[indexPath.section]]?[indexPath.row] else {
            return UITableViewCell()
        }

        var friend: FriendModel = frendsArray[index]

        if isSearch {
            friend = filteredfrendsArray[index]
        }
        
        
        cell.gradientLayer.colors = [startColorGradient.cgColor, endColorGradient.cgColor]
        cell.gradientLayer.frame = tableView.bounds
        cell.gradientLayer.startPoint = CGPoint.zero
        cell.gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        cell.nameLabel.text = ("\(friend.lastName) \(friend.firstName)")
        cell.avatarCustomView.set(imageURL: friend.photo50)
        
        return cell
    }
    
}

// MARK: - Table Delegate
extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let index = dicGroupIdFriendsInAlphabetical[masAlphabetical[indexPath.section]]?[indexPath.row] else { return }
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                layout.itemSize = CGSize(width: view.frame.width, height: 500)
        let detailFriendsCollectionViewController = DetailFriendsCollectionViewController(collectionViewLayout: layout)
        
        var friend = frendsArray[index]
        
        if isSearch {
            friend = filteredfrendsArray[index]
        }
        
       
        
        detailFriendsCollectionViewController.titleDetail = ("\(friend.lastName) \(friend.firstName)")
        
        detailFriendsCollectionViewController.idUser = friend.id
        
        let navigationControllerDelegate = NavigationControllerDelegate()
        navigationController?.delegate = navigationControllerDelegate
        
        navigationController?.pushViewController(detailFriendsCollectionViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.contentView.backgroundColor = endColorGradient
        (view as? UITableViewHeaderFooterView)?.textLabel?.textColor = UIColor.white
    }
}

// MARK: - Table SearchBarDelegate
extension FriendsTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapHideKeyboardGestureRecognizer)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapHideKeyboardGestureRecognizer)
    }
    
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
               isSearch = false
        }
    
        
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchText.count == 0 {
                isSearch = false
                groupIdFriendsInAlphabetical(frendsArray)
                tableView.reloadData()
            } else {
                isSearch = true
                filteredfrendsArray = frendsArray.filter({ (friend: FriendModel) -> Bool in
            
                    return friend.lastName.lowercased().contains(searchText.lowercased())
                })
                groupIdFriendsInAlphabetical(filteredfrendsArray)
                tableView.reloadData()
            }
        }
    
    
}
