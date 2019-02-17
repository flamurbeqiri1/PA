//
//  MockAlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

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
}

extension MockAlbumService {
    fileprivate func listAllAlbums() {
        self.albums = [
            Album(userId: 1,
                  id: 1,
                  title: "quidem molestiae enim"),
            Album(userId: 1,
                  id: 2,
                  title: "sunt qui excepturi placeat culpa"),
            Album(userId: 1,
                  id: 3,
                  title: "omnis laborum odio")
        ]
    }
}
