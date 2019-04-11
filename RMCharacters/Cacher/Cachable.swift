//
//  File.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-11.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

public protocol Cachable {
    var fileName: String { get }
    
    func transform() -> Data
}

extension Cachable where Self: Codable {
    public func transform() -> Data {
        do {
            let encoded = try JSONEncoder().encode(self)
            return encoded
        } catch let error {
            fatalError("Unable to encode object: \(error)")
        }
    }
}
