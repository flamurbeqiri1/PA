//
//  PABackendService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation
import Alamofire

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
        Alamofire.request(path, method: .get)
            .validate()
            .responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    guard let dataToDecode = response.data else {
                        #if DEBUG
                        print("DEBUG: Response data missing!")
                        #endif
                        return
                    }
                    let object = try JSONDecoder().decode(T.self, from: dataToDecode)
                    completion(Result.success(object))
                } catch let error {
                    #if DEBUG
                    if let decodingError = error as? DecodingError {
                        print("JSON decoding error: \(String(describing: decodingError))")
                    }
                    #endif
                    completion(Result.failure(error))
                }
            case .failure(let error):
                #if DEBUG
                print("DEBUG: Error on getting response: \(error)")
                #endif
                completion(Result.failure(error))
            }
        }
    }
    
    func store<T: Encodable>(_ object: T, path: String, completion: @escaping (Result<T>) -> Void)  {
        guard let url = URL(string: path) else {
            completion(Result.failure(BackendServiceError.urlNotConvertible))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        do {
            let dataEncoded = try JSONEncoder().encode(object)
            request.httpBody = dataEncoded
        } catch let error {
            #if DEBUG
            print("DEBUG: Could not encode data: \(error)")
            #endif
            completion(Result.failure(BackendServiceError.encodingError))
        }
        Alamofire.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                completion(Result.success(object))
            case .failure(let error):
                #if DEBUG
                print("DEBUG: Error on getting response: \(error)")
                #endif
                completion(Result.failure(error))
            }
        }
    }
    
    
}
