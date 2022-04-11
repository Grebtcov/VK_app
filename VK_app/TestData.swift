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
                                    GroupModel(group_id: "1", avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 1"),
                                  GroupModel(group_id: "2", avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 2"),
                                  GroupModel(group_id: "3", avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 3"),
                                  GroupModel(group_id: "4", avatar: PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"), name: "Группа 4")])
    
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
    
    
    static var news = [
        NewsModel(id_news: "1", text: "Философы Древней Греции понимали под словом космос Мироздание, рассматривая его как упорядоченную гармоничную систему. Космосу противопоставлялся беспорядок, хаос. Для древних греков понятия порядка и красоты в явлениях природы были тесно связаны. Эта точка зрения держалась в философии и науке долго; недаром даже Коперник считал, что орбиты планет должны быть окружностями лишь потому, что окружность красивее эллипса.", photo: [PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),], group_id: "1"),
        NewsModel(id_news: "2",
                  text: "Вы такого еще не видели",
                  photo: [
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                  ],
                  group_id: "1"),
        NewsModel(id_news: "3",
                  text: "Очень важная информация!",
                  photo: [
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                  ],
                  group_id: "3"),
        NewsModel(id_news: "4",
                  text: "Новость 4",
                  photo: [
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                  ],
                  group_id: "3"),
        NewsModel(id_news: "5",
                  text: "Новость 5",
                  photo: [
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                    PhotoModel(photo: "photo\(Int.random(in: 1...6))", name: "Foto"),
                  ],
                  group_id: "4"),
    ]
    
    
    
    
}
