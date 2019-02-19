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
    private lazy var loaderService: LoaderService = dependencies.loaderService()
    // Properties
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.loaderService.showLoadingIndicator()
        self.postService.listAllPosts { [weak self] (result) in
            guard let `self` = self else { return }
            self.loaderService.hideLoadingIndicator()
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
        if let destination = segue.destination as? PACommentsTableViewController, let comments = sender as? [Comment] {
            destination.currentComments = comments
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
        self.loaderService.showLoadingIndicator()
        self.postService.getComments(from: currentPost.id) { [weak self] (result) in
            guard let `self` = self else { return }
            self.loaderService.hideLoadingIndicator()
            switch result {
            case .success(let comments):
                self.performSegue(withIdentifier: "showComments", sender: comments)
            case .failure(let error):
                print("Error getting current comments: \(error)")
            }
        }
        
    }
}
