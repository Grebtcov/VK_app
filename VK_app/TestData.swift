//
//  TestData.swift
//  VK_app
//
//  Created by Alex x on 3/27/22.
//

import Foundation

struct User {
    
    static var info = UserModel(id_user: "0",
                                name: "Арни",
                                lastName: "Карников",
                                avatar: 0,
                                photos: [
                                  PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                                  PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")
                                ],
                                groups: [
                                  GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                                  GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                                  GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                                  GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4")])
    
}


struct Frends {
    
   static var masFrends = [
        UserModel(id_user: "1",
                  name: "Виталий",
                  lastName: "Гарин",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я", peopleClickedLike: ["1","2"]),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото", peopleClickedLike: ["0", "3"]),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")
                  ],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4")]),
        UserModel(id_user: "2",
                  name: "Паша",
                  lastName: "Катонов",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 5")]),
        UserModel(id_user: "3",
                  name: "Саша",
                  lastName: "Булошов",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 5")]),
        UserModel(id_user: "4",
                  name: "Паша",
                  lastName: "Аркадий",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 5")]),
        UserModel(id_user: "5",
                  name: "Саша",
                  lastName: "Ягодкин",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 5")]),
        UserModel(id_user: "6",
                  name: "Петя",
                  lastName: "Ашотов",
                  avatar: 0,
                  photos: [
                    PhotoModel(photo: "avatar\(Int.random(in: 1...6))", name: "Это я"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Фото")],
                  groups: [
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4"),
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 5")]),
    ]
    
    static var masAllGroups = [
        GroupModel(avatar: PhotoModel(photo: "photo1", name: "Foto"), name: "Группа 1"),
        GroupModel(avatar: PhotoModel(photo: "photo2", name: "Foto"), name: "Группа 2"),
        GroupModel(avatar: PhotoModel(photo: "photo3", name: "Foto"), name: "Группа 3"),
        GroupModel(avatar: PhotoModel(photo: "photo4", name: "Foto"), name: "Группа 4"),
        GroupModel(avatar: PhotoModel(photo: "photo5", name: "Foto"), name: "Группа 5"),
        GroupModel(avatar: PhotoModel(photo: "photo6", name: "Foto"), name: "Группа 6")
    ]
    
    
    
    
}
