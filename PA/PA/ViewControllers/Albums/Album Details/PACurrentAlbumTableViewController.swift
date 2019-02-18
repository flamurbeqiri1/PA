//
//  PACurrentAlbumTableViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PACurrentAlbumTableViewController: UITableViewController, HasDependencies {

    // Services
    private lazy var albumService: AlbumService = dependencies.albumService()
    // Properties
    var currentAlbum: [Album]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PASingleImageViewController, let imageSent = sender as? UIImage {
            destination.singleImage = imageSent
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Table view data source

extension PACurrentAlbumTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentAlbum.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PACurrentAlbumTableViewCell", for: indexPath) as? PACurrentAlbumTableViewCell else {
            return UITableViewCell()
        }
        let albumPhotoData = self.currentAlbum[indexPath.row]
        cell.albumTitleLabel.text = albumPhotoData.title
        if let albumThumbnailUrl = albumPhotoData.thumbnailUrl {
            self.albumService.loadImage(from: albumThumbnailUrl, into: cell.albumThumbnailImage) { (result) in
                switch result {
                case .success:
                    break // nothing to do, image loaded into ImageView
                case .failure(let error):
                    print("DEBUG: Load image failed with error: \(error)")
                }
            }
        } else {
             print("DEBUG: Thumbnail Image url not found from album")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentAlbum = self.currentAlbum[indexPath.row]
        guard let albumImageUrl = currentAlbum.url else {
            // TODO alert
            print("Album url not fround from album: \(currentAlbum)")
            return
        }
        self.albumService.getImage(from: albumImageUrl) { (result) in
            switch result {
            case .success(let image):
                self.performSegue(withIdentifier: "showFullImage", sender: image)
            case .failure(let error):
                print("Getting image error: \(error)")
            }
        }
    }
}
