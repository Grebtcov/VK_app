//
//  PhotoCollectionViewCell.swift
//  VK_app
//
//  Created by Alex x on 3/27/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let photoImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupUIElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCollectionViewCell {
    
    func setupView() {
        addSubview(photoImageView)
        addSubview(nameLabel)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setupUIElement() {
        
        setupPhotoImageView()
        setupNameLabel()
    }
    
    func setupPhotoImageView() {
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25).isActive = true
        
        
       
    }
    
    func setupNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
    }
    
}
