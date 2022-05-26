//
//  DBWorker.swift
//  VK_app
//
//  Created by Alex x on 5/26/22.
//

import Foundation
import RealmSwift

class DBService {
    
    private init() {}
    
    static let shared = DBService()
    
    
    func saveGroups(groups: [GroupModel]) {
        
        let realmGroups: [RealmGroup] = groups.map { group in
            let realmGroup = RealmGroup()
            realmGroup.id = group.id
            realmGroup.photo50 = group.photo50
            realmGroup.isMember = group.isMember
            realmGroup.name = group.name
            
            return realmGroup
        }
        
        saveInRealm(array: realmGroups)
    }
    
    func saveFriends(friends: [FriendModel]) {
        
        let realmFriends: [RealmFriend] = friends.map { friend in
            let realmFriend = RealmFriend()
            realmFriend.id = friend.id
            realmFriend.photo50 = friend.photo50
            realmFriend.firstName = friend.firstName
            realmFriend.lastName = friend.lastName
            
            return realmFriend
        }
        
        saveInRealm(array: realmFriends)
    }
    
    func savePhotos(photos: [PhotoModel], userId: Int) {
        
        let realmPhotos: [RealmPhoto] = photos.map { photo in
            let realmPhoto = RealmPhoto()
            
            realmPhoto.idUser = userId
            realmPhoto.text = photo.text
            realmPhoto.likesCount = photo.likes.count
            realmPhoto.userLikes = photo.likes.userLikes
            realmPhoto.repostsCount = photo.reposts.count
            realmPhoto.photo = photo.getUrlBigPhoto()
                        
            return realmPhoto
        }
        
        saveInRealm(array: realmPhotos)
    }
    
    
    
    private func saveInRealm<T: Object>(array: [T]) {
        print("Сохраняем в БД")
        guard let realm = try? Realm() else { return }
        try? realm.write{
            array.forEach { realm.add($0) }
        }
    }
    
    func restoreGroups() throws -> [GroupModel] {
        print("Берем данные из БД")
        let realm = try Realm()
        let objects = realm.objects(RealmGroup.self)
        let groups = Array(
            objects.map{
                GroupModel(
                    id: $0.id,
                    isMember: $0.isMember,
                    name: $0.name,
                    photo50: $0.photo50
                )
            }
        )
        
        return groups
        
    }
    
    func restoreFriends() throws -> [FriendModel] {
        print("Берем данные из БД")
        let realm = try Realm()
        let objects = realm.objects(RealmFriend.self)
        let friends = Array(
            objects.map{
                FriendModel(
                    id: $0.id,
                    photo50: $0.photo50,
                    firstName: $0.firstName,
                    lastName: $0.lastName
                )
            }
        )
        
        return friends
        
    }
    
    func restorePhotos(userId: Int) throws -> [PhotoModel] {
        print("Берем данные из БД")
        let realm = try Realm()
        let objects = realm.objects(RealmPhoto.self).filter { $0.idUser == userId }
        let friends = Array(
            objects.map{
                PhotoModel(
                    sizes: [SizeModel(height: 1, width: 1, url: $0.photo , type: "BD")],
                    text: $0.text,
                    likes: LikeModel(count: $0.likesCount, userLikes: $0.userLikes),
                    reposts: RepostModel(count: $0.repostsCount)
                )
            }
        )
        
        return friends
        
    }
    
    
    
}
