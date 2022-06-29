//
//  NewsTableViewController.swift
//  VK_app
//
//  Created by Alex x on 4/10/22.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class NewsTableViewController: UITableViewController {

    private let headerCellIndent = "HeaderNewsCell"
    private let textCellIndent = "ContentTextCell"
    private let imageCellIdent = "ContentImageCell"
    private let footerCellIndent = "FooterNewsCell"
    
    var news = NewsModelMock.getData()
    var sections: [[UITableViewCell]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNewsTableView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
}

// MARK: Setup
extension NewsTableViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func setupNewsTableView() {
        
        view.backgroundColor = .white
        
        title = "Новости"
       
        tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: headerCellIndent)
        tableView.register(ContentTextCell.self, forCellReuseIdentifier: textCellIndent)
        tableView.register(ContentImageCell.self, forCellReuseIdentifier: imageCellIdent)
        tableView.register(FooterNewsCell.self, forCellReuseIdentifier: footerCellIndent)
        
        tableView.separatorStyle = .none
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let item = UITabBarItem(title: "Новости", image: UIImage(systemName: "newspaper"), tag: 1)
        self.tabBarItem = item
    }
}

// MARK: - Table view data source
extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return news?.items.count ?? 0
        return news[section].items.count + 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = news[indexPath.section].groups
        let footer = news[indexPath.section].footer
        
        //for n in news {
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIndent, for: indexPath) as? FriendsAndGroupTableViewCell else {
                        return UITableViewCell()
            }
            cell.setCell(name: group.name, url: group.photo50)
            
            return cell
           // section.append(header)
        } else if indexPath.row >= 1, indexPath.row < news[indexPath.section].items.count + 1 {
            let m = news[indexPath.section].items[indexPath.row - 1]
                if let m = m as? PhotoItem {
                    
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: imageCellIdent, for: indexPath) as? ContentImageCell else {
                                return UITableViewCell()
                    }
                    
                    cell.setCell(url: m.url, size: view.frame.width)

                    return cell
                } else if let m = m as? TextItem {

                    guard let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndent, for: indexPath) as? ContentTextCell else {
                                return UITableViewCell()
                    }
                    cell.setCell(text: m.text)

                    return cell
                }
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: footerCellIndent, for: indexPath) as? FooterNewsCell else {
                        return UITableViewCell()
            }
            
            cell.setCell(like: footer.likes?.count, viewed: footer.views?.count)

           return cell
        }
        
        return UITableViewCell()
    }
    
    
    
}


