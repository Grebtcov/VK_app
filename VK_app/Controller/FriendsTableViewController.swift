//
//  MainViewController.swift
//  VK_app
//
//  Created by Alex x on 3/22/22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let tabBar = UITabBarController()
    let IdUser = User.info.id_user
    let frendsArray = Frends.masFrends
    
    
    let cellIndetifier = "friendsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainTableViewController()
    }
}

extension FriendsTableViewController {
    
    func setupMainTableViewController() {
        view.backgroundColor = .white
        
        tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: cellIndetifier)
        
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
        return frendsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as? FriendsAndGroupTableViewCell

        cell?.nameLabel.text = ("\(frendsArray[indexPath.row].name) \(frendsArray[indexPath.row].lastName)")
        
        let avatarId = frendsArray[indexPath.row].avatar
        let avatarPhoto = frendsArray[indexPath.row].photos[avatarId].photo
        
        cell?.avatarCustomView.profileImageView.image = UIImage(named: avatarPhoto)
        
        return cell ?? UITableViewCell()
    }
    
}

// MARK: - Table Delegate
extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                layout.itemSize = CGSize(width: view.frame.width, height: 500)
        let detailFriendsCollectionViewController = DetailFriendsCollectionViewController(collectionViewLayout: layout)
        
        detailFriendsCollectionViewController.titleDetail = ("\(frendsArray[indexPath.row].name) \(frendsArray[indexPath.row].lastName)")
        
        detailFriendsCollectionViewController.photosArray = frendsArray[indexPath.row].photos
        detailFriendsCollectionViewController.idUser = IdUser
        
        navigationController?.pushViewController(detailFriendsCollectionViewController, animated: true)
    }
    
}
