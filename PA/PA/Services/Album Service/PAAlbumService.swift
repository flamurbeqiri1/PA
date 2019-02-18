//
//  PAAlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PAAlbumService: AlbumService {

    private let backendService: BackendService
    private let imageLoadingService: ImageLoadingService
    
    let imagePlaceholder = #imageLiteral(resourceName: "ico_ImagePlaceholder")
    let allAlbumsUrl = "\(baseUrl)albums/"
    
    init(backendService: BackendService, imageLoadingService: ImageLoadingService) {
        #if DEBUG
        print("DEBUG: Start PAAlbumService")
        #endif
        self.backendService = backendService
        self.imageLoadingService = imageLoadingService
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
    
    func getImage(from url: String, completion: @escaping (Result<UIImage>) -> Void) {
        guard let url = URL(string: url) else {
            completion(Result.failure(AlbumServiceError.objectNotFound))
            return
        }
        self.imageLoadingService.loadImage(from: url, completion: { (result) in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let image):
                completion(Result.success(image))
            }
        })
    }
    
    func loadImage(from url: String, into imageView: UIImageView, completion: @escaping (Result<Void>) -> Void) {
        imageView.image = self.imagePlaceholder
        guard let url = URL(string: url) else {
            completion(Result.failure(AlbumServiceError.objectNotFound))
            return
        }
        self.imageLoadingService.load(url: url, into: imageView, placeholder: self.imagePlaceholder, completion: { (result) in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success:
                completion(Result.success(()))
            }
        })
    }
    
}
