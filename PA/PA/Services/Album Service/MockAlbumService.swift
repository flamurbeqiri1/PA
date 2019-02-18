//
//  MockAlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class MockAlbumService: AlbumService {
    
    var albums: [Album]!
    
    init() {
        print("Start MockAlbumService")
        listAllAlbums()
    }
    
    deinit {
        print("Stop MockAlbumService")
    }
    
    func listAllAlbums(completion: @escaping (Result<[Album]>) -> Void) {
        // Simulate network latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("MockAlbumService.listAllAlbums")
            completion(Result.success(self.albums))
        }
    }
    
    func getImage(from url: String, completion: @escaping (Result<UIImage>) -> Void) {
        // Simulate network latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("MockAlbumService.getImage")
            guard let url = URL(string: url),
                let image = UIImage(contentsOfFile: url.path) else {
                    completion(Result.failure(MockAlbumServiceError.noImage))
                    return
            }
            completion(Result.success(image))
        }
    }
    
    func loadImage(from url: String, into imageView: UIImageView, completion: @escaping (Result<Void>) -> Void) {
        imageView.image = nil
        // Simulate network latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("MockAlbumService.loadImage")
            guard let url = URL(string: url),
                let image = UIImage(contentsOfFile: url.path) else {
                    completion(Result.failure(MockAlbumServiceError.noImage))
                    return
            }
            imageView.image = image
            completion(Result.success(()))
        }
    }
}

enum MockAlbumServiceError: String {
    case albumNotFound = "Album not found"
    case noImage = "No image"
}

extension MockAlbumServiceError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}

extension MockAlbumService {
    fileprivate func listAllAlbums() {
        self.albums = [
            Album(userId: 1,
                  albumId: nil,
                  id: 1,
                  title: "quidem molestiae enim",
                  url: nil,
                  thumbnailUrl: nil),
            Album(userId: 1,
                  albumId: nil,
                  id: 2,
                  title: "sunt qui excepturi placeat culpa",
                  url: nil,
                  thumbnailUrl: nil),
            Album(userId: 1,
                  albumId: nil,
                  id: 3,
                  title: "omnis laborum odio",
                  url: nil,
                  thumbnailUrl: nil)
        ]
    }
}
