//
//  PAPostService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class PAPostService: PostService {
    
    private let backendService: BackendService
    
    let allPostsUrl = "\(baseUrl)posts/"
    
    init(backendService: BackendService) {
        #if DEBUG
        print("DEBUG: Start PAPostService")
        #endif
        self.backendService = backendService
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: Stop PAPostService")
        #endif
    }
    
    func listAllPosts(completion: @escaping (Result<[Post]>) -> Void) {
        self.backendService.get([Post].self, path: allPostsUrl) { (result) in
            switch result {
            case .success(let posts):
                completion(Result.success(posts))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func getComments(from postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        self.backendService.get([Comment].self, path: getPostCommentUrl(from: postId)) { (result) in
            switch result {
            case .success(let comments):
                completion(Result.success(comments))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
}

// MARK: - Helpers

extension PAPostService {
    
    func getPostCommentUrl(from postId: Int) -> String {
        return "\(baseUrl)posts/\(postId)/comments"
    }
}
