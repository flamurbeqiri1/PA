//
//  AppDependency.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class AppDependency: CoreDependency {
    
    // MARK: Backend
    override func backendService() -> BackendService {
        return PABackendService()
    }
    
    // MARK: Post
    override func postService() -> PostService {
        return PAPostService(backendService: backendService())
    }
}
