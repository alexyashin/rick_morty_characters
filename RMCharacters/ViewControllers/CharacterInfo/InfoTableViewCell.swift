//
//  InfoTableViewCell.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-09.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    func configure(parameter: String, value: String) {
        textLabel?.text = parameter
        detailTextLabel?.text = value.isEmpty ? "-" : value
    }
}
