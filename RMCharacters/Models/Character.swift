//
//  Character.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-07.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let image: String
    let status: String
    let species: String
    let type: String
    let gender: String
}
