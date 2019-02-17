//
//  PostService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

protocol PostService {
    func listAllPosts(completion: @escaping (Result<[Post]>) -> Void)
    func getComment(from postId: Int, completion: @escaping (Result<Comment>) -> Void)
}
