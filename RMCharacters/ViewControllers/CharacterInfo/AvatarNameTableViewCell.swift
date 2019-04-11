//
//  AvatarNameTableViewCell.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-09.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import UIKit
import SDWebImage

class AvatarNameTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameImageView: UILabel!

    func configure(with character: Character) {
        avatarImageView.sd_setImage(with: URL(string: character.image), completed: nil)
        nameImageView.text = character.name
    }
}
