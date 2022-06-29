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

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNewsTableCell()
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension ContentTextCell {
    func setCell(text: String) {
        textNewsLabel.text = text
        //layoutIfNeeded()
//        textNewsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        textNewsLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
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
            textNewsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing),
            textNewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -.spacing),
            textNewsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .spacing),
            textNewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spacing),
//            textNewsLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
//            textNewsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
    }
}

private extension CGFloat {
    static let spacing: CGFloat = 10
}

