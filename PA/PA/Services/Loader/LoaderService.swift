//
//  LoaderService.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

protocol LoaderService {
    var isLoading: Bool { get }
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
