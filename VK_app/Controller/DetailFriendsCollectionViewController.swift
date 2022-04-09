//
//  DetailFriendsCollectionViewController.swift
//  VK_app
//
//  Created by Alex x on 3/24/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailFriendsCollectionViewController: UICollectionViewController {
    
    var titleDetail: String?
    var idUser: String?
    var photosArray: [PhotoModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainCollectionView()
        
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}

// MARK: Setup
extension DetailFriendsCollectionViewController {
    
    func setupMainCollectionView() {
        
        navigationItem.title = titleDetail ?? ""
        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
}



// MARK: UICollectionViewDataSource
extension DetailFriendsCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArray?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell
        
        
        
        if let item = photosArray?[indexPath.row] {
            cell?.nameLabel.text = item.name
            
            cell?.photoImageView.image = UIImage(named: item.photo)
            cell?.likeControl.countLike = item.countLike
            for id in item.peopleClickedLike where id == idUser {
                cell?.likeControl.isLike = true
                break
            }
        }
        
        
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
