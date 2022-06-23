//
//  NewsTableViewCell.swift
//  VK_app
//
//  Created by Alex x on 4/10/22.
//

import UIKit

class HeaderNewsCell: UITableViewCell {
    
    let ident = "HeaderNewsCell"
    
    private let avatarGroupView = AvatarCustomView()
    private let groupNameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNewsTableCell()
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

private extension HeaderNewsCell {
    
    func setupNewsTableCell() {
        contentView.addSubview(avatarGroupView)
        contentView.addSubview(groupNameLabel)
    }
    
    func setupUIElements() {
        
        [avatarGroupView ,groupNameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupAvatarGroupView()
        setupGroupNameLabel()
    }
    
    func setupAvatarGroupView() {
        
        avatarGroupView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing).isActive = true
        avatarGroupView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .spacing).isActive = true
    }
    
    func setupGroupNameLabel() {
        
        groupNameLabel.leftAnchor.constraint(equalTo: avatarGroupView.rightAnchor, constant: .spacing).isActive = true
        groupNameLabel.centerYAnchor.constraint(equalTo: avatarGroupView.centerYAnchor).isActive = true
    }
}

private extension CGFloat {
    static let spacing: CGFloat = 10
}
