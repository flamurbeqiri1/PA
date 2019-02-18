//
//  AlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

protocol AlbumService {
    func listAllAlbums(completion: @escaping (Result<[Album]>) -> Void)
    func getImage(from url: String, completion: @escaping (Result<UIImage>) -> Void)
    func loadImage(from url: String, into imageView: UIImageView, completion: @escaping (Result<Void>) -> Void)
}

public enum AlbumServiceError: String {
    case objectNotFound = "Object not found"
    case urlEncodingFailed = "URL encoding failed"
}

extension AlbumServiceError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}
