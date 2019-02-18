//
//  ImageLoadingService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

public protocol ImageLoadingService {
    func loadImage(from url: URL, completion: @escaping (Result<UIImage>) -> Void)
    func load(url: URL, into imageView: UIImageView, placeholder: UIImage?, completion: @escaping (Result<Void>) -> Void)
}

public enum ImageLoadingServiceError {
    case dataLoadingFailed(URL)
}

extension ImageLoadingServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .dataLoadingFailed(url): return "Failed to load image data for \(url)"
        }
    }
}
