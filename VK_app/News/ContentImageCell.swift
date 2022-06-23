//
//  ContentImageCell.swift
//  VK_app
//
//  Created by Alex x on 6/22/22.
//

import UIKit

class ContentImageCell: UITableViewCell {
    
    let ident = "ContentImageCell"

    private let imageCollectionView = UICollectionView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

private extension ContentImageCell {
    
    func setupNewsTableCell() {
        addSubview(imageCollectionView)
    }
    
    func setupUIElements() {
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        setupImageCollectionView()
    }
    
    func setupImageCollectionView() {
       
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            imageCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
        
        
    }
}

