//
//  PANukeImageLoadingService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit
import Nuke

class PANukeImageLoadingService: ImageLoadingService {
    
    init() {
        #if DEBUG
        print("DEBUG: Start PANukeImageLoadingService")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: Stop PANukeImageLoadingService")
        #endif
    }
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage>) -> Void) {
        ImagePipeline.shared.loadImage(with: url, progress: nil) { (imageResponse, error) in
            if let error = error {
                #if DEBUG
                print("DEBUG: Nuke Error: \(error.debugDescription)")
                #endif
                completion(Result.failure(ImageLoadingServiceError.dataLoadingFailed(url)))
                return
            }
            guard let response = imageResponse else {
                completion(Result.failure(ImageLoadingServiceError.dataLoadingFailed(url)))
                return
            }
            completion(Result.success(response.image))
        }
    }
    
    func load(url: URL, into imageView: UIImageView, placeholder: UIImage?, completion: @escaping (Result<Void>) -> Void) {
        let options = ImageLoadingOptions(placeholder: placeholder, transition: .fadeIn(duration: 0.33))
        
        Nuke.loadImage(with: url, options: options, into: imageView) { (_, error) in
            if let error = error {
                #if DEBUG
                print("DEBUG: Nuke Error: \(error.debugDescription)")
                #endif
                completion(Result.failure(ImageLoadingServiceError.dataLoadingFailed(url)))
                return
            }
            completion(Result.success(()))
        }
    }
}
