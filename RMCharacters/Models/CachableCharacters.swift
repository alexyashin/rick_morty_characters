//
//  CachableCharacters.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-11.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

struct CachableCharacters: Cachable, Codable {
    let store: String
    let characters: [Character]
    
    var fileName: String {
        return "\(store)"
    }
    
    init(store: String, characters: [Character]) {
        self.store = store
        self.characters = characters
    }
}
