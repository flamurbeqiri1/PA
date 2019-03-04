//
//  BackendService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

protocol BackendService {
    func get<T: Decodable>(_ type: T.Type, path: String, completion: @escaping (Result<T>) -> Void)
    func store<T: Encodable>(_ object: T, path: String, completion: @escaping (Result<T>) -> Void)
}

public enum BackendServiceError: String {
    case objectNotFound = "Object not found"
    case decodingError = "Object not decoded properly"
    case encodingError = "Object not encoded properly"
    case urlNotConvertible = "Given path is not convertible to URL"
}

extension BackendServiceError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}
