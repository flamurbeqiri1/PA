//
//  StoryboardIdentifier.swift
//  PA
//
//  Created by Flamur Beqiri on 18/02/2019.
//  Copyright © 2019 Flamur Beqiri. All rights reserved.
//

import Foundation

import UIKit

public struct StoryboardIdentifier {
    
    let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
}

public extension StoryboardIdentifier {
    public static let loader = StoryboardIdentifier(rawValue: "Loader")
}

public extension UIStoryboard {
    
    public convenience init(name: StoryboardIdentifier, bundle storyboardBundleOrNil: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: storyboardBundleOrNil)
    }
    
}
