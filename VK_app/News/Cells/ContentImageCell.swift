//
//  ContentImageCell.swift
//  VK_app
//
//  Created by Alex x on 6/22/22.
//

import UIKit

class ContentImageCell: UITableViewCell {
    
    let ident = "ContentImageCell"

    private let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNewsTableCell()
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension ContentImageCell {
    func setCell(url: String, size: CGFloat) {
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: size),
            image.heightAnchor.constraint(equalToConstant: size)
        ])
            
        guard let url = URL(string: url) else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { data in
            
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }
    }
}

private extension ContentImageCell {
    
    func setupNewsTableCell() {
        contentView.addSubview(image)
    }
    
    func setupUIElements() {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        setupImageCollectionView()
    }
    
    func setupImageCollectionView() {
       
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        
    }
}

