//
//  FrendsTableViewCell.swift
//  VK_app
//
//  Created by Alex x on 3/25/22.
//

import UIKit

class FriendsAndGroupTableViewCell: UITableViewCell {
    
    
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }

}

extension FriendsAndGroupTableViewCell {
    
    func setupMainTableViewCell() {
        
        contentView.addSubview(avatarCustomView)
        contentView.addSubview(nameLabel)
        
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
        
//        avatarCustomView.layer.shadowColor = UIColor.blue.cgColor
//        avatarCustomView.layer.shadowRadius = 4
//        avatarCustomView.layer.shadowOpacity = 1
//        avatarCustomView.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    func setupNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: avatarCustomView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatarCustomView.rightAnchor, constant: 15).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
    }
    
}
