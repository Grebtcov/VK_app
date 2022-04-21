//
//  NewsTableViewCell.swift
//  VK_app
//
//  Created by Alex x on 4/10/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let avatarGroupView = AvatarCustomView()
    let groupNameLabel = UILabel()
    let textNewsLabel = UILabel()
    let newsBodyView = UIView()
    let likeControl = LikeCustomControl()
    let commentButton = UIButton()
    let shareButton = UIButton(type: .custom)
    let viewedImageView = UIImageView()
    let viewedLabel = UILabel()
    
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

private extension NewsTableViewCell {
    
    func setupNewsTableCell() {
        
        contentView.addSubview(avatarGroupView)
        contentView.addSubview(groupNameLabel)
        contentView.addSubview(textNewsLabel)
        contentView.addSubview(newsBodyView)
        contentView.addSubview(likeControl)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(viewedImageView)
        contentView.addSubview(viewedLabel)
    }
    
    func setupUIElements() {
        
        [avatarGroupView ,groupNameLabel ,textNewsLabel ,newsBodyView ,likeControl ,commentButton ,shareButton ,viewedImageView ,viewedLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupAvatarGroupView()
        setupGroupNameLabel()
        setupTextNewsLabel()
        setupNewsBodyView()
        setupLikeControl()
        setupCommentButton()
        setupShareButton()
        setupViewedImageView()
        setupViewedLabel()
        
    }
    
    func setupAvatarGroupView() {
        
        avatarGroupView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarGroupView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
    }
    
    func setupGroupNameLabel() {
        
        groupNameLabel.leftAnchor.constraint(equalTo: avatarGroupView.rightAnchor, constant: 10).isActive = true
        groupNameLabel.centerYAnchor.constraint(equalTo: avatarGroupView.centerYAnchor).isActive = true
    }
    
    func setupTextNewsLabel() {
        
        textNewsLabel.topAnchor.constraint(equalTo: avatarGroupView.bottomAnchor, constant: 10).isActive = true
        textNewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        textNewsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    }
    
    func setupNewsBodyView() {
       
        newsBodyView.topAnchor.constraint(equalTo: textNewsLabel.bottomAnchor, constant: 10).isActive = true
        newsBodyView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        newsBodyView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        
    }
    
    func setupLikeControl() {
        
        likeControl.widthAnchor.constraint(equalToConstant: 50).isActive = true
        likeControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        likeControl.topAnchor.constraint(equalTo: newsBodyView.bottomAnchor, constant: 10).isActive = true

        likeControl.leftAnchor.constraint(equalTo: avatarGroupView.leftAnchor).isActive = true
    }
    
    func setupCommentButton() {
        commentButton.topAnchor.constraint(equalTo: likeControl.topAnchor).isActive = true
        commentButton.leftAnchor.constraint(equalTo: likeControl.rightAnchor, constant: 20).isActive = true
        
        commentButton.setImage(UIImage(systemName: "bubble.right"), for: .normal)
    }
    
    func setupShareButton() {
        shareButton.topAnchor.constraint(equalTo: likeControl.topAnchor).isActive = true
        shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 20).isActive = true
        
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
    }
    
    func setupViewedImageView() {
        
        viewedImageView.topAnchor.constraint(equalTo: likeControl.topAnchor).isActive = true
        viewedImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -70).isActive = true
        
        viewedImageView.image = UIImage(systemName: "eye")
    }
    
    func setupViewedLabel() {
        
        viewedLabel.topAnchor.constraint(equalTo: likeControl.topAnchor).isActive = true
        viewedLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        viewedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
    }
}
