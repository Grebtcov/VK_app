//
//  MainViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    
    let IdUser = User.info.id_user
    let frendsArray = Frends.masFrends.sorted(by: {$0.lastName < $1.lastName})
    let cellIndetifier = "friendsCell"
    
    
    
   
    
    
    
    private let searchBar = UISearchBar()
    
    private var dicGroupIdFriendsInAlphabetical: [String:[Int]] = [:]
    private var masAlphabetical: [String] = []
    private var filteredfrendsArray: [UserModel] = []
    private var isSearch = false
    
    private lazy var tapHideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    private let startColorGradient = UIColor.white
    private let endColorGradient = UIColor.systemBlue

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isUserInteractionEnabled = true
        
        dicGroupIdFriendsInAlphabetical = groupIdFriendsInAlphabetical(frendsArray)
        
        setupMainTableViewController()
       
    }
    
}

extension FriendsTableViewController {
    
    func groupIdFriendsInAlphabetical(_ mas:[UserModel] ) -> [String:[Int]] {
        masAlphabetical = []
        var dicResult: [String:[Int]] = [:]
        
        for (i,friend) in mas.enumerated() {
            guard let firstCharLastName = friend.lastName.first else { return [:]}
            
            if dicResult[String(firstCharLastName)] == nil {
                dicResult[String(firstCharLastName)] = []
                dicResult[String(firstCharLastName)]?.append(i)
                masAlphabetical.append(String(firstCharLastName))
            } else {
                dicResult[String(firstCharLastName)]?.append(i)
            }
        }
        
        return dicResult
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
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dicGroupIdFriendsInAlphabetical[masAlphabetical[section]]?.count ?? 0
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
        
        var friend: UserModel = frendsArray[index]
        
        if isSearch {
            friend = filteredfrendsArray[index]
        }
        
        
        cell.gradientLayer.colors = [startColorGradient.cgColor, endColorGradient.cgColor]
        cell.gradientLayer.frame = tableView.bounds
        cell.gradientLayer.startPoint = CGPoint.zero
        cell.gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        cell.nameLabel.text = ("\(friend.lastName) \(friend.name)")
        
        let avatarId = friend.avatar
        let avatarPhoto = friend.photos[avatarId].photo
        
        cell.avatarCustomView.profileImageView.image = UIImage(named: avatarPhoto)
        
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
        
       
        
        detailFriendsCollectionViewController.titleDetail = ("\(friend.lastName) \(friend.name)")
        
        detailFriendsCollectionViewController.photosArray = friend.photos
        detailFriendsCollectionViewController.idUser = IdUser
        
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
                dicGroupIdFriendsInAlphabetical = groupIdFriendsInAlphabetical(frendsArray)
                tableView.reloadData()
            } else {
                isSearch = true
                filteredfrendsArray = frendsArray.filter({ (friend: UserModel) -> Bool in
            
                    return friend.lastName.lowercased().contains(searchText.lowercased())
                })
                dicGroupIdFriendsInAlphabetical = groupIdFriendsInAlphabetical(filteredfrendsArray)
                tableView.reloadData()
            }
        }
    
    
}
