//
//  CharacterTableViewCell.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-09.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    func configure(with character: Character) {
        textLabel?.text = character.name
    }
}
