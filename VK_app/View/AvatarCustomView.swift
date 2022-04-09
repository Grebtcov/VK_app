//
//  avatarCustomView.swift
//  VK_app
//
//  Created by Alex x on 4/6/22.
//

import UIKit

@IBDesignable class AvatarCustomView: UIView {
    
    let profileImageView = UIImageView()
    let shadowView = UIView()
    
    @IBInspectable var sizeAvatar: CGFloat = 50 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOffsetWidth: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOffsetHeight: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAvatarCustomView()
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AvatarCustomView {
    
    func setupAvatarCustomView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        widthAnchor.constraint(equalToConstant: sizeAvatar).isActive = true
        
        addSubview(shadowView)
        addSubview(profileImageView)
        
        
    }
    
    func setupUIElements() {
        setupProfileImageView()
        setupShadowView()
    }
    
    func setupProfileImageView() {
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        profileImageView.center = self.center
        
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 1
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = sizeAvatar / 2
    }
    
    func setupShadowView() {
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        shadowView.center = self.center
        
        //shadowView.clipsToBounds = true
        shadowView.backgroundColor = .black
        shadowView.layer.cornerRadius = sizeAvatar / 2
        
        shadowView.layer.shadowColor = shadowColor
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        
    }
    
}
