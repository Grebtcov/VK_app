//
//  LoadViewController.swift
//  VK_app
//
//  Created by Alex x on 4/13/22.
//

import UIKit

class LoadViewController: UIViewController {
    
    let pointOne = UIView()
    let pointTwo = UIView()
    let pointThree = UIView()
    
    let gorizontalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(gorizontalStackView)

        gorizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        gorizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        gorizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        let size: CGFloat = 50
        
        [pointOne, pointTwo, pointThree].forEach {
            gorizontalStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: size).isActive = true
            $0.heightAnchor.constraint(equalToConstant: size).isActive = true
            $0.backgroundColor = .systemGray
            $0.layer.cornerRadius = size / 2
        }
        gorizontalStackView.axis = .horizontal
        gorizontalStackView.distribution = .fillProportionally
        gorizontalStackView.spacing = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.pointOne.alpha = 0
        }
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.repeat, .autoreverse]) {
            self.pointTwo.alpha = 0
        }
        
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .autoreverse]) {
            self.pointThree.alpha = 0
        }
        
        let _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(presentMainTabBarController), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func presentMainTabBarController() {
        
        pointOne.layer.removeAllAnimations()
        pointTwo.layer.removeAllAnimations()
        pointThree.layer.removeAllAnimations()
        
        
        // TODO: убрать в Root Navigation и через него контролировать жизненный цикл классов
        let newsTableViewController = NewsTableViewController()
        let friendsTableViewController = FriendsTableViewController(style: .plain)
        let groupsTableViewController = GroupsTableViewController()

        let newsNavigationController = UINavigationController(rootViewController: newsTableViewController)
        let friendsNavigationController = UINavigationController(rootViewController: friendsTableViewController)
        let groupsNavigationController = UINavigationController(rootViewController: groupsTableViewController)

        let mainTabBarController = UITabBarController()
        mainTabBarController.setViewControllers([friendsNavigationController, newsNavigationController, groupsNavigationController ], animated: true)

        mainTabBarController.modalPresentationStyle = .overCurrentContext
        mainTabBarController.selectedIndex = 1

        friendsTableViewController.loadViewIfNeeded()
        groupsTableViewController.loadViewIfNeeded()

        present(mainTabBarController, animated: true, completion: nil)
        
    }
    

}
