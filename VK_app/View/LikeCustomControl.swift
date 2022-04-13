//
//  LikeCustomControl.swift
//  VK_app
//
//  Created by Alex x on 4/6/22.
//

import UIKit

class LikeCustomControl: UIControl {

    let size: CGFloat = 50
    let likeButton = UIButton(type: .custom)
    let countLikeLabel = UILabel()
    
    var countLike = 0 {
        didSet {
            changeLike()
        }
    }
    var isLike = false {
        didSet {
            changeLike()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMainView()
        setupUIElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LikeCustomControl {
    
    func setupMainView() {
        addSubview(likeButton)
        addSubview(countLikeLabel)
    }
    
    func setupUIElements() {
        setupLikeButton()
        setupCountLikeLabel()
        changeLike()
    }
    
    func setupLikeButton() {
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        likeButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        likeButton.addTarget(self, action: #selector(clickOn), for: .touchUpInside)
        likeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        likeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5).isActive = true
        
    }
    
    func setupCountLikeLabel() {
        
        countLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        countLikeLabel.widthAnchor.constraint(equalToConstant: size).isActive = true
        countLikeLabel.heightAnchor.constraint(equalToConstant: size).isActive = true
        countLikeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        countLikeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        countLikeLabel.textColor = .black
        
    }
    
    func changeLike() {
        var heartImage: UIImage
        if isLike {
            heartImage = UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration.init(paletteColors: [UIColor.systemRed])) ?? UIImage()
        } else {
            heartImage = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration.init(paletteColors: [UIColor.systemRed])) ?? UIImage()
        }
        
        likeButton.setImage(heartImage, for: .normal)
        countLikeLabel.text = String(countLike)
    }
    
    @objc func clickOn() {
        
        
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: []) {
            self.likeButton.transform = CGAffineTransform(scaleX: 3, y: 3)
        } completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: []) {
                self.likeButton.transform = CGAffineTransform.identity
            }
        }
        
        isLike.toggle()
        countLike = isLike ? countLike + 1 : countLike - 1
    }
    
}
