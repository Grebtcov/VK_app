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

    let cellIndent = "newsCell"
    var news: NewsModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNewsTableView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        GroupNetworkService.getGroupSearch(search: "Music") { json in
            //print("Group Search \(json)")
        }
        
        NewsfeedNetworkService.getNewsfeed { news in
            self.news = news
        }
    }
}

// MARK: Setup
extension NewsTableViewController {
    
    func setupNewsTableView() {
        
        view.backgroundColor = .white
        
        title = "Новости"
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellIndent)
       // tableView.register(FriendsAndGroupTableViewCell.self, forCellReuseIdentifier: cellIndent)
        
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndent, for: indexPath) as? NewsTableViewCell,
              let news = news else {
            return UITableViewCell()
        }

        
        //MARK: Заполнение новости
        cell.avatarGroupView.profileImageView.image = nil
        cell.groupNameLabel.text = ""
        cell.textNewsLabel.text = news.items[indexPath.row].text
        cell.textNewsLabel.font = UIFont.systemFont(ofSize: 14)
        cell.textNewsLabel.numberOfLines = 0
        cell.textNewsLabel.lineBreakMode = .byWordWrapping
        cell.textNewsLabel.sizeToFit()
        
        
        let sizeImage = tableView.frame.width
        cell.newsBodyView.widthAnchor.constraint(equalToConstant: sizeImage).isActive = true
        cell.newsBodyView.heightAnchor.constraint(equalToConstant: sizeImage).isActive = true
        
        // TODO: вынести в функцию
//       if news[indexPath.row].photo.count == 1 {
//           let imageView = UIImageView()
//           
//           cell.newsBodyView.addSubview(imageView)
//           
//           imageView.translatesAutoresizingMaskIntoConstraints = false
//           imageView.center = cell.newsBodyView.center
//           imageView.widthAnchor.constraint(equalToConstant: sizeImage).isActive = true
//           imageView.heightAnchor.constraint(equalToConstant: sizeImage).isActive = true
//           imageView.image = UIImage(named: news[indexPath.row].photo[0].photo)
//           imageView.contentMode = .scaleAspectFill
//           imageView.clipsToBounds = true
//       } else if news[indexPath.row].photo.count == 2  {
//           let margin: CGFloat = 5
//           
//           let imageView1 = UIImageView()
//           let imageView2 = UIImageView()
//           
//           cell.newsBodyView.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           cell.newsBodyView.addSubview(imageView1)
//           cell.newsBodyView.addSubview(imageView2)
//           
//           [imageView1, imageView2].forEach {
//               $0.translatesAutoresizingMaskIntoConstraints = false
//               $0.centerYAnchor.constraint(equalTo: cell.newsBodyView.centerYAnchor).isActive = true
//               $0.contentMode = .scaleAspectFill
//               $0.clipsToBounds = true
//           }
//           
//           imageView1.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView1.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView1.leftAnchor.constraint(equalTo: cell.newsBodyView.leftAnchor).isActive = true
//           
//           imageView2.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView2.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView2.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: margin).isActive = true
//           
//           imageView1.image = UIImage(named: news[indexPath.row].photo[0].photo)
//           imageView2.image = UIImage(named: news[indexPath.row].photo[1].photo)
//       } else if news[indexPath.row].photo.count == 3  {
//           let margin: CGFloat = 5
//           
//           let imageView1 = UIImageView()
//           let imageView2 = UIImageView()
//           let imageView3 = UIImageView()
//           
//           cell.newsBodyView.addSubview(imageView1)
//           cell.newsBodyView.addSubview(imageView2)
//           cell.newsBodyView.addSubview(imageView3)
//           
//           [imageView1, imageView2, imageView3].forEach {
//               $0.translatesAutoresizingMaskIntoConstraints = false
//               $0.contentMode = .scaleAspectFill
//               $0.clipsToBounds = true
//           }
//           
//           imageView1.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView1.heightAnchor.constraint(equalToConstant: sizeImage).isActive = true
//           imageView1.topAnchor.constraint(equalTo: cell.newsBodyView.topAnchor).isActive = true
//           imageView1.leftAnchor.constraint(equalTo: cell.newsBodyView.leftAnchor).isActive = true
//           
//           imageView2.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView2.heightAnchor.constraint(equalToConstant: sizeImage / 2).isActive = true
//           imageView2.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: margin).isActive = true
//           imageView2.topAnchor.constraint(equalTo: cell.newsBodyView.topAnchor).isActive = true
//           
//           imageView3.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView3.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView3.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: margin).isActive = true
//           imageView3.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: margin).isActive = true
//           
//           imageView1.image = UIImage(named: news[indexPath.row].photo[0].photo)
//           imageView2.image = UIImage(named: news[indexPath.row].photo[1].photo)
//           imageView3.image = UIImage(named: news[indexPath.row].photo[2].photo)
//          
//       } else if news[indexPath.row].photo.count >= 4  {
//           let margin: CGFloat = 5
//           
//           let imageView1 = UIImageView()
//           let imageView2 = UIImageView()
//           let imageView3 = UIImageView()
//           let imageView4 = UIImageView()
//           
//           cell.newsBodyView.addSubview(imageView1)
//           cell.newsBodyView.addSubview(imageView2)
//           cell.newsBodyView.addSubview(imageView3)
//           cell.newsBodyView.addSubview(imageView4)
//           
//           [imageView1, imageView2, imageView3, imageView4].forEach {
//               $0.translatesAutoresizingMaskIntoConstraints = false
//               $0.contentMode = .scaleAspectFill
//               $0.clipsToBounds = true
//           }
//           
//           imageView1.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView1.heightAnchor.constraint(equalToConstant: sizeImage / 2).isActive = true
//           imageView1.topAnchor.constraint(equalTo: cell.newsBodyView.topAnchor).isActive = true
//           imageView1.leftAnchor.constraint(equalTo: cell.newsBodyView.leftAnchor).isActive = true
//           
//           imageView2.widthAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView2.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView2.leftAnchor.constraint(equalTo: cell.newsBodyView.leftAnchor).isActive = true
//           imageView2.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: margin).isActive = true
//           
//           imageView3.widthAnchor.constraint(equalToConstant: sizeImage / 2).isActive = true
//           imageView3.heightAnchor.constraint(equalToConstant: sizeImage / 2).isActive = true
//           imageView3.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: margin).isActive = true
//           imageView3.topAnchor.constraint(equalTo: cell.newsBodyView.topAnchor).isActive = true
//           
//           imageView4.widthAnchor.constraint(equalToConstant: sizeImage / 2).isActive = true
//           imageView4.heightAnchor.constraint(equalToConstant: sizeImage / 2 - margin).isActive = true
//           imageView4.leftAnchor.constraint(equalTo: imageView2.rightAnchor, constant: margin).isActive = true
//           imageView4.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: margin).isActive = true
//           
//           imageView1.image = UIImage(named: news[indexPath.row].photo[0].photo)
//           imageView2.image = UIImage(named: news[indexPath.row].photo[1].photo)
//           imageView3.image = UIImage(named: news[indexPath.row].photo[2].photo)
//           imageView4.image = UIImage(named: news[indexPath.row].photo[3].photo)
//           
//           if news[indexPath.row].photo.count > 4 {
//               let countImageLabel = UILabel()
//               imageView4.addSubview(countImageLabel)
//               countImageLabel.translatesAutoresizingMaskIntoConstraints = false
//               countImageLabel.text = "+\(news[indexPath.row].photo.count - 1)"
//               countImageLabel.font = UIFont.systemFont(ofSize: 54)
//               countImageLabel.centerYAnchor.constraint(equalTo: imageView4.centerYAnchor).isActive = true
//               countImageLabel.centerXAnchor.constraint(equalTo: imageView4.centerXAnchor).isActive = true
//               countImageLabel.textColor = .white
//               countImageLabel.layer.opacity = 0.8
//           }
//           
//       }
        
        cell.viewedLabel.text = "200k"
        
        
        return cell
    }
    
}
