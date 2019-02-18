//
//  Album.swift
//  PA
//
//  Created by Flamur Beqiri on 17/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

struct Album: Codable {
    let userId: Int?
    let albumId: Int?
    let id: Int
    let title: String
    let url: String?
    let thumbnailUrl: String?
}
