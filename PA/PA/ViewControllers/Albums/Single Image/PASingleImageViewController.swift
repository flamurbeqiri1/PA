//
//  PASingleImageViewController.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PASingleImageViewController: UIViewController {

    @IBOutlet private weak var singleImageView: UIImageView!
    // Properties
    var singleImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singleImageView.image = singleImage
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
