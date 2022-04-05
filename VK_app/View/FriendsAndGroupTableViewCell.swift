//
//  FrendsTableViewCell.swift
//  VK_app
//
//  Created by Alex x on 3/25/22.
//

import UIKit

class FriendsAndGroupTableViewCell: UITableViewCell {
    
    let profileImageView = UIImageView()
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
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        
    }
    
    func setupUIElements() {
        
        setupProfileImageView()
        setupNameLabel()
        
    }
    
    func setupProfileImageView() {
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let size: CGFloat = 50
        
        profileImageView.heightAnchor.constraint(equalToConstant: size).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 1
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = size / 2
    }
    
    func setupNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
    }
    
}
