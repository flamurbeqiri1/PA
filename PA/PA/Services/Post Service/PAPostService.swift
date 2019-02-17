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
        print("Start PAPostService")
        #endif
        self.backendService = backendService
    }
    
    deinit {
        #if DEBUG
        print("Stop PAPostService")
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
    
    func getPost(postId: Int, completion: @escaping (Result<Post>) -> Void) {
        self.backendService.get(Post.self, path: getPostCommentUrl(from: postId)) { (result) in
            switch result {
            case .success(let post):
                completion(Result.success(post))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
}

// MARK: - Helpers

extension PAPostService {
    
    func getPostCommentUrl(from postID: Int) -> String {
        return "\(baseUrl)/comments/\(postID)"
    }
}
