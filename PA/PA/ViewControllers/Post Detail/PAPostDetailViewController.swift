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
    var currentPost: Post!
    var currentComment: Comment!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.postTitleLabel.text = currentPost.title
        self.postBodyLabel.text = currentPost.body
        self.commentNameLabel.text = currentComment.name
        self.commentEmailLabel.text = currentComment.email
        self.commentBodyLabel.text = currentComment.body
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
