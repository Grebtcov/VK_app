//
//  DataWorker.swift
//  VK_app
//
//  Created by Alex x on 5/26/22.
//

import Foundation
import RealmSwift

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
            let groups = try RealmService.shared.restoreGroups()
        
            if groups.isEmpty {
                print("Запрос в сеть")
                GroupNetworkService.getAllgroup(userId: userId) { groups in
                    RealmService.shared.saveGroups(groups: groups)
                    
                    guard let group = try? RealmService.shared.restoreGroups() else { return }
                    
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
            let friends = try RealmService.shared.restoreFriends()
        
            if friends.isEmpty {
                print("Запрос в сеть")
                FriendsNetworkService.getFriends { friends in
                    RealmService.shared.saveFriends(friends: friends)
                    
                    guard let friend = try? RealmService.shared.restoreFriends() else { return }
                    
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
            let photos = try RealmService.shared.restorePhotos(userId: userId)
        
            if photos.isEmpty {
                print("Запрос в сеть")
                PhotosNetworkService.getAllPhotos(userId: userId) { photos in
                    RealmService.shared.savePhotos(photos: photos, userId: userId)
                    
                    guard let photo = try? RealmService.shared.restorePhotos(userId: userId) else { return }
                    
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


