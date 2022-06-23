//
//  ContentTextCell.swift
//  VK_app
//
//  Created by Alex x on 6/22/22.
//

import UIKit

class ContentTextCell: UITableViewCell {
    
    let ident = "ContentTextCell"
    
    private let textNewsLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

private extension ContentTextCell {
    
    func setupNewsTableCell() {
        contentView.addSubview(textNewsLabel)
    }
    
    func setupUIElements() {
        
        textNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupTextNewsLabel()
    }
    
    func setupTextNewsLabel() {
        NSLayoutConstraint.activate([
            textNewsLabel.topAnchor.constraint(equalTo: topAnchor, constant: .spacing),
            textNewsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -.spacing),
            textNewsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .spacing),
        ])
        
    }
}

private extension CGFloat {
    static let spacing: CGFloat = 10
}

