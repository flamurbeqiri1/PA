//
//  MockLoaderService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class MockLoaderService: LoaderService {
    
    var isLoading: Bool { return false }
    
    init() {
        print("Start MockLoaderService")
    }
    
    deinit {
        print("Stop MockLoaderService")
    }
    
    func showLoadingIndicator() {
        print("Loader showing")
    }
    
    func hideLoadingIndicator() {
        print("Loader hided")
    }
}
