//
//  MockPostService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class MockPostService: PostService {
    
    var posts: [Post]!
    var currentPostComments: [Comment]!
    
    init() {
        print("Start MockPostService")
        listAllPosts()
        loadComments()
    }
    
    deinit {
        print("Stop MockPostService")
    }
    
    func listAllPosts(completion: @escaping (Result<[Post]>) -> Void) {
        // Simulate network latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("MockPostService.listAllPosts")
            completion(Result.success(self.posts))
        }
    }
    
    func getComments(from postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        // Simulate network latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("MockPostService.getComments")
            completion(Result.success(self.currentPostComments!))
        }
    }
}

extension MockPostService {
    fileprivate func listAllPosts() {
        posts = [
            Post(userId: 1,
                id: 1,
                title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                body:"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
            Post(userId: 1,
                 id: 2,
                 title: "qui est esse",
                 body:"est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"),
            Post(userId: 1,
                 id: 3,
                 title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
                 body:"et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut")
        ]
    }
    
    fileprivate func loadComments() {
        self.currentPostComments = [
            Comment(postId: 1,
                                          id: 1,
                                          name: "id labore ex et quam laborum",
                                          email: "Eliseo@gardner.biz",
                                          body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
            Comment(postId: 1,
                    id: 2,
                    name: "id labore ex et quam laborum",
                    email: "Eliseo@gardner.biz",
                    body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
            Comment(postId: 1,
                    id: 3,
                    name: "id labore ex et quam laborum",
                    email: "Eliseo@gardner.biz",
                    body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
            Comment(postId: 1,
                    id: 4,
                    name: "id labore ex et quam laborum",
                    email: "Eliseo@gardner.biz",
                    body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
        ]
    }
}
