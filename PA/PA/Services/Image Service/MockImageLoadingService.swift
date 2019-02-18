//
//  MockImageLoadingService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class MockImageLoadingService: ImageLoadingService {
    
    init() {
        print("Start MockImageLoadingService")
    }
    
    deinit {
        print("Stop MockImageLoadingService")
    }
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage>) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data, scale: UIScreen.main.scale) else {
                    throw MockImageLoadingServiceError.invalidData
                }
                DispatchQueue.main.async {
                    print("Download image performed: \(image)")
                    completion(Result.success(image))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(Result.failure(error))
                }
            }
        }
    }
    
    func load(url: URL, into imageView: UIImageView, placeholder: UIImage?, completion: @escaping (Result<Void>) -> Void) {
        imageView.image = placeholder
        self.loadImage(from: url) { result in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let image):
                imageView.image = image
                print("Load url into: \(imageView) performed)")
                completion(Result.success(()))
            }
        }
    }
}

enum MockImageLoadingServiceError: String {
    case invalidData = "Invalid image data"
}

extension MockImageLoadingServiceError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}
