//
//  FrendsTableViewCell.swift
//  VK_app
//
//  Created by Alex x on 3/25/22.
//

import UIKit

class FriendsAndGroupTableViewCell: UITableViewCell {
    
    
    let gradientLayer = CAGradientLayer()
    let avatarCustomView = AvatarCustomView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainTableViewCell()
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension FriendsAndGroupTableViewCell {
    
    func setupMainTableViewCell() {
        
        contentView.addSubview(avatarCustomView)
        contentView.addSubview(nameLabel)
        
        self.clipsToBounds = true
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func setupUIElements() {
        
        setupAvatarCustomView()
        setupNameLabel()
        
    }
    
    func setupAvatarCustomView() {
        
        avatarCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarCustomView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarCustomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        avatarCustomView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
    }
    
    func setupNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerYAnchor.constraint(equalTo: avatarCustomView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatarCustomView.rightAnchor, constant: 15).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
    }
    
}
