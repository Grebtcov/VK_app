//
//  TestData.swift
//  VK_app
//
//  Created by Alex x on 3/27/22.
//

import Foundation

struct Frends {
    
   static var masFrends = [
        UserModel(name: "Виталий",
                  lastName: "Криванков",
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
                    GroupModel(avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4")]),
        UserModel(name: "Паша",
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
        UserModel(name: "Саша",
                  lastName: "Калашников",
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
