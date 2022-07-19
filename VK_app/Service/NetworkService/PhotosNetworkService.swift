//
//  PhotosNetworkService.swift
//  VK_app
//
//  Created by Alex x on 5/10/22.
//

import Foundation

class PhotosNetworkService {
    
    static func getAllPhotos(userId: Int, completion: @escaping([PhotoModel]) -> ()) {
        
        var urlComponents = URLComponents(string: "https://api.vk.com/method/photos.getAll")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "owner_id", value: "\(userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { data in
            DispatchQueue.global().async {
                guard let photos = try? JSONDecoder().decode(ArrayResponse<PhotoModel>.self, from: data) else { return }
                completion(photos.response)
            }
        }
    }
    
}
