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
            case .success(let posts):
                print(posts)
                self.posts = posts
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
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
        let data = self.posts[indexPath.row]
        cell.postTitleLabel.text = data.title
        cell.postBodyLabel.text = data.body
        return cell
    }
}
