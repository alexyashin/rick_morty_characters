//
//  NSObject_NameOfClass.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-07.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
