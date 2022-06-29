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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNewsTableCell()
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension FooterNewsCell {
    func setCell(like: Int?, viewed: Int?) {
        likeControl.countLike = like ?? 0
        viewedLabel.text = String(viewed ?? 0)
        self.addBottomBorder()
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
            likeControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            likeControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
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

private extension UITableViewCell {
    
    func addBottomBorder() {
        
        let border = UIView()
        border.backgroundColor = .systemGray
        self.addSubview(border)
        border.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            border.heightAnchor.constraint(equalToConstant: 1),
            border.widthAnchor.constraint(equalTo: self.widthAnchor),
            border.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        }
    }
