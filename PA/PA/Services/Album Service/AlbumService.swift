//
//  AlbumService.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

protocol AlbumService {
    func listAllAlbums(completion: @escaping (Result<[Album]>) -> Void)
}