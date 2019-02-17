//
//  PABackendService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

class PABackendService: BackendService {
    
    init() {
        #if DEBUG
        print("DEBUG: Start PABackendService")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: Stop PABackendService")
        #endif
    }
    
    func get<T>(_ type: T.Type, path: String, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        // TODO
    }
    
    
}
