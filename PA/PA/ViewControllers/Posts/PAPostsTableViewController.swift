//
//  PostsTableViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PAPostsTableViewController: UITableViewController, HasDependencies {
    
    // Services
    private lazy var postService: PostService = dependencies.postService()
    // Properties
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.postService.listAllPosts { (result) in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let posts):
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PAPostDetailViewController, let senderAsTuple = sender as? (Post, Comment) {
            destination.currentPost = senderAsTuple.0 // Post
            destination.currentComment = senderAsTuple.1 // Comment
        }
    }

}

// MARK: - Table view data source

extension PAPostsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PAPostTableViewCell else {
            return UITableViewCell()
        }
        let postData = self.posts[indexPath.row]
        cell.postTitleLabel.text = postData.title
        cell.postBodyLabel.text = postData.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPost = self.posts[indexPath.row]
        self.postService.getComment(from: currentPost.id) { (result) in
            switch result {
            case .success(let comment):
                self.performSegue(withIdentifier: "showSinglePost", sender: (currentPost, comment))
            case .failure(let error):
                print("Error getting current post: \(error)")
            }
        }
        
    }
}
