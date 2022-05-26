//
//  DataWorker.swift
//  VK_app
//
//  Created by Alex x on 5/26/22.
//

import Foundation

enum LoadData {
    
    case group
    case photo
    case friend

}

class DataService {
    
    static let shared = DataService()
    
    private init() {}
    
    func loadGroups(userId: Int, completion: @escaping([GroupModel]) -> ()) {
        
        do {
            let groups = try DBService.shared.restoreGroups()
        
            if groups.isEmpty {
                print("Запрос в сеть")
                GroupNetworkService.getAllgroup(userId: userId) { groups in
                    DBService.shared.saveGroups(groups: groups)
                    
                    guard let group = try? DBService.shared.restoreGroups() else { return }
                    
                    completion(group)
                }
            } else {
                print("Данные из БД")
                completion(groups)
            }
        } catch {
            print(error)
        }
        
    }
    
    func loadFriends(completion: @escaping([FriendModel]) -> ()) {
        
        do {
            let friends = try DBService.shared.restoreFriends()
        
            if friends.isEmpty {
                print("Запрос в сеть")
                FriendsNetworkService.getFriends { friends in
                    DBService.shared.saveFriends(friends: friends)
                    
                    guard let friend = try? DBService.shared.restoreFriends() else { return }
                    
                    completion(friend)
                }
            } else {
                completion(friends)
            }
        } catch {
            print(error)
        }
        
    }
    
    func loadPhotos(userId: Int, completion: @escaping([PhotoModel]) -> ()) {
        
        do {
            let photos = try DBService.shared.restorePhotos(userId: userId)
        
            if photos.isEmpty {
                print("Запрос в сеть")
                PhotosNetworkService.getAllPhotos(userId: userId) { photos in
                    DBService.shared.savePhotos(photos: photos, userId: userId)
                    
                    guard let photo = try? DBService.shared.restorePhotos(userId: userId) else { return }
                    
                    completion(photo)
                }
                
            } else {
                completion(photos)
            }
        } catch {
            print(error)
        }
        
    }
    
    
}


