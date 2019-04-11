//
//  CharacterInfoViewController.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-07.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import UIKit

enum CharacterInfoType: String {
    case name = "Name"
    case species = "Species"
    case status = "Status"
    case type = "Type"
    case gender = "Gender"
}

class CharacterInfoViewController: UIViewController {

    @IBOutlet weak var nameNavigationBar: UINavigationBar!
    @IBOutlet weak var infoTableView: UITableView!
    
    var character: Character!
    
    private let infoArray: [CharacterInfoType] = [
        .name,
        .species,
        .status,
        .type,
        .gender
    ]
    
    class func controller() -> CharacterInfoViewController {
        return controllerFromStoryboard(.main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        infoTableView.tableFooterView = UIView(frame: .zero)
    }

    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CharacterInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoType = infoArray[indexPath.row]
        switch infoType {
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarNameCell") as! AvatarNameTableViewCell
            cell.configure(with: character)
            return cell
        case .species:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoTableViewCell
            cell.configure(parameter: infoType.rawValue, value: character.species)
            return cell
        case .status:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoTableViewCell
            cell.configure(parameter: infoType.rawValue, value: character.status)
            return cell
        case .type:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoTableViewCell
            cell.configure(parameter: infoType.rawValue, value: character.type)
            return cell
        case.gender:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoTableViewCell
            cell.configure(parameter: infoType.rawValue, value: character.gender)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let infoType = infoArray[indexPath.row]
        switch infoType {
        case .name:
            return 100
        default:
            return tableView.rowHeight
        }
    }
}
