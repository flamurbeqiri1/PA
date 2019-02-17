//
//  PAPostDetailViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PAPostDetailViewController: UIViewController, HasDependencies {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentEmailLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    // Services
    private lazy var postService: PostService = dependencies.postService()
    
    // Properties
    var currentPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let post = currentPost {
            self.postService.getComment(from: post.id) { (result) in
                switch result {
                case .success(let comment):
                    self.postTitleLabel.text = post.title
                    self.postBodyLabel.text = post.body
                    self.commentNameLabel.text = comment.name
                    self.commentEmailLabel.text = comment.email
                    self.commentBodyLabel.text = comment.body
                case .failure(let error):
                    print("Error getting current post: \(error)")
                }
            }
        }
    }

}
