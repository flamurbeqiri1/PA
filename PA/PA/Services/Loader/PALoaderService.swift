//
//  PALoaderService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import UIKit

class PALoaderService: LoaderService {
    
    private let windowBounds = UIApplication.shared.keyWindow?.bounds ?? UIScreen.main.bounds
    private weak var loaderWindowRootViewController: UIViewController?
    
    public var isLoading: Bool {
        return loaderWindowRootViewController != nil
    }
    
    init() {
        #if DEBUG
        print("Start AOWLoaderService")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("Stop AOWLoaderService")
        #endif
    }
    
    func showLoadingIndicator() {
        guard !isLoading else {
            #if DEBUG
            print("A loader is already on screen")
            #endif
            return
        }
        
        guard let loader = UIStoryboard(name: .loader).instantiateInitialViewController() else {
            fatalError("Missing initial view controller in \(StoryboardIdentifier.loader) storyboard")
        }
        loader.modalTransitionStyle = .crossDissolve
        let newWindow = UIWindow(frame: windowBounds)
        newWindow.windowLevel = UIWindow.Level.statusBar
        newWindow.rootViewController = UIViewController()
        newWindow.isHidden = false
        loaderWindowRootViewController = newWindow.rootViewController
        loaderWindowRootViewController?.present(loader, animated: true, completion: nil)
        
    }
    
    func hideLoadingIndicator() {
        guard isLoading else {
            #if DEBUG
            print("No loader on screen")
            #endif
            return
        }
        loaderWindowRootViewController?.dismiss(animated: true, completion: nil)
        loaderWindowRootViewController = nil
    }
}

class LoaderViewController: UIViewController {
    
    @IBOutlet weak var loaderImageView: UIImageView!
    let loaderImage = UIImage.animatedImageNamed("loader", duration: 16.0/24.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loaderImageView.image = loaderImage
    }
}
