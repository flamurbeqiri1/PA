//
//  AlbumsTableViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PAAlbumsTableViewController: UITableViewController, HasDependencies {

    // Services
    private lazy var albumService: AlbumService = dependencies.albumService()
    // Properties
    var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.albumService.listAllAlbums { (result) in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let albums):
                self.albums = albums
                self.tableView.reloadData()
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table view data source

extension PAAlbumsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as? PAAlbumTableViewCell else {
            return UITableViewCell()
        }
        let albumData = self.albums[indexPath.row]
        cell.albumTitleLabel.text = albumData.title
        return cell
    }
}
