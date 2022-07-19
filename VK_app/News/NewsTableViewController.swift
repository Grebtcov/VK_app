//
//  NewsTableViewController.swift
//  VK_app
//
//  Created by Alex x on 4/10/22.
//

import UIKit
//import Firebase
//import FirebaseCore
//import FirebaseFirestore

class NewsTableViewController: UITableViewController {

    private let headerCellIndent = "HeaderNewsCell"
    private let textCellIndent = "ContentTextCell"
    private let imageCellIdent = "ContentImageCell"
    private let footerCellIndent = "FooterNewsCell"
    
    var news: NewsModel?
   // var sections: [[UITableViewCell]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNewsTableView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        NewsfeedNetworkService.getNewsfeed { result in
            
            DispatchQueue.main.async {
                self.news = result
                print("photo \(result.items[0].attachments?[0].photo?.sizes[0].url)")
                self.tableView.reloadData()
            }
        }
        
        
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
        return news?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.items[section].countCell ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = news?.items[indexPath.section] else { return UITableViewCell()}
        
        switch indexPath.row {
        case 0:
            return setHeaderCell(cellForRowAt: indexPath)
        case 1 where item.text != "" :
            return setTextCell(cellForRowAt: indexPath, text: item.text)
        case 1 where item.attachments?[0].type == "photo" :
            guard let photo = item.attachments?[0].photo else { return UITableViewCell() }
            return setPhotoCell(cellForRowAt: indexPath, photo: photo)
        case 2 where item.countCell > 3 :
            guard let photo = item.attachments?[0].photo else { return UITableViewCell() }
                return setPhotoCell(cellForRowAt: indexPath, photo: photo)
        case 2, 3:
            return setFooterCell(cellForRowAt: indexPath, item: item)
        default: break
        }
        
        return UITableViewCell()
    }
    
    //MARK: setCells
    func setHeaderCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIndent, for: indexPath) as? FriendsAndGroupTableViewCell,
              let id = news?.items[indexPath.section].sourceId,
              let result = news?.getSource(id: id)
        else { return UITableViewCell() }
       
        cell.setCell(name: result.name ?? "", url: result.photo ?? "")
        
        return cell
    }
    
    func setTextCell(cellForRowAt indexPath: IndexPath, text: String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndent, for: indexPath) as? ContentTextCell
        else { return UITableViewCell() }
       
        cell.setCell(text: text)
        
        return cell
    }
    
    func setPhotoCell(cellForRowAt indexPath: IndexPath, photo: PhotoModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: imageCellIdent, for: indexPath) as? ContentImageCell
        else { return UITableViewCell() }
        
        var sizes = photo.sizes.first(where: {$0.width >= Int(view.frame.width)})
        
        if sizes == nil {
            sizes = photo.sizes[0]
        }
        
        cell.setCell(url: sizes?.url ?? "", size: view.frame.width)
        
        return cell
    }
    
    func setFooterCell(cellForRowAt indexPath: IndexPath, item: ItemModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: footerCellIndent, for: indexPath) as? FooterNewsCell
        else { return UITableViewCell() }
        
        cell.setCell(like: item.likes.count, viewed: item.views.count)
        
        return cell
    }
    
    
}


