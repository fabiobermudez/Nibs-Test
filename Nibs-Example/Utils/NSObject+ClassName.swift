//
//  NSObject+ClassName.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import Foundation

extension NSObject {
    class func className() -> String {
        return String(describing: self)
    }
}
