//
//  PACommentsTableViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PACommentsTableViewController: UITableViewController {
    
    var currentComments: [Comment]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Table view data source

extension PACommentsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.currentComments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PACommentTableViewCell", for: indexPath) as? PACommentTableViewCell else {
            return UITableViewCell()
        }
        let commentData = self.currentComments[indexPath.row]
        cell.commentNameLabel.text = commentData.name
        cell.commentEmailLabel.text = commentData.email
        cell.commentBodyLabel.text = commentData.body
        return cell
    }
}
