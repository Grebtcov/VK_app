//
//  FooterNewsCell.swift
//  VK_app
//
//  Created by Alex x on 6/22/22.
//

import UIKit

class FooterNewsCell: UITableViewCell {
    
    let ident = "FooterNewsCell"
    
    private let likeControl = LikeCustomControl()
    private let commentButton = UIButton()
    private let shareButton = UIButton(type: .custom)
    private let viewedImageView = UIImageView()
    private let viewedLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

private extension FooterNewsCell {
    
    func setupNewsTableCell() {
        contentView.addSubview(likeControl)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(viewedImageView)
        contentView.addSubview(viewedLabel)
    }
    
    func setupUIElements() {
        
        [likeControl ,commentButton ,shareButton ,viewedImageView ,viewedLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupLikeControl()
        setupCommentButton()
        setupShareButton()
        setupViewedImageView()
        setupViewedLabel()
        
    }
    
   
    func setupLikeControl() {
        
        NSLayoutConstraint.activate([
            likeControl.widthAnchor.constraint(equalToConstant: 50),
            likeControl.heightAnchor.constraint(equalToConstant: 25),
            likeControl.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        ])
        
        
    }
    
    func setupCommentButton() {
        
        NSLayoutConstraint.activate([
            commentButton.topAnchor.constraint(equalTo: likeControl.topAnchor),
            commentButton.leftAnchor.constraint(equalTo: likeControl.rightAnchor, constant: 20)
        ])
        
        commentButton.setImage(UIImage(systemName: "bubble.right"), for: .normal)
    }
    
    func setupShareButton() {
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: likeControl.topAnchor),
            shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 20)
        ])
       
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
    }
    
    func setupViewedImageView() {
        NSLayoutConstraint.activate([
            viewedImageView.topAnchor.constraint(equalTo: likeControl.topAnchor),
            viewedImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -70)
        ])
        
        viewedImageView.image = UIImage(systemName: "eye")
    }
    
    func setupViewedLabel() {
        
        NSLayoutConstraint.activate([
            viewedLabel.topAnchor.constraint(equalTo: likeControl.topAnchor),
            viewedLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            viewedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
}

