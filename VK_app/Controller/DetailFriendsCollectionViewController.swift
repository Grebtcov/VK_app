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
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
            edgePan.edges = .left

            view.addGestureRecognizer(edgePan)
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

// MARK: - Table Delegate
extension DetailFriendsCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //guard let index = photosArray?[indexPath.row] else { return }
        
        let photoViewController = PhotoViewController()
        photoViewController.photosArray = photosArray
        photoViewController.idPhoto = indexPath.row
        
        let navigationControllerDelegate = NavigationControllerDelegate()
        navigationController?.delegate = navigationControllerDelegate
        
        navigationController?.pushViewController(photoViewController, animated: true)
    }
}

