//
//  PAAlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class PAAlbumService: AlbumService {
    
    private let backendService: BackendService
    
    let allAlbumsUrl = "\(baseUrl)albums/"
    
    init(backendService: BackendService) {
        #if DEBUG
        print("DEBUG: Start PAAlbumService")
        #endif
        self.backendService = backendService
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: Stop PAAlbumService")
        #endif
    }
    
    func listAllAlbums(completion: @escaping (Result<[Album]>) -> Void) {
        self.backendService.get([Album].self, path: allAlbumsUrl) { (result) in
            switch result {
            case .success(let albums):
                completion(Result.success(albums))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
}
