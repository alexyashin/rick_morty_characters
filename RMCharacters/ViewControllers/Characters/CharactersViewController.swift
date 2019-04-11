//
//  ViewController.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-07.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        charactersTableView.tableFooterView = UIView(frame: .zero)
        
        getCharacters()
    }
    
    func getCharacters() {
        startActivityIndicator()
        CharactersAPI().getCharacters(completionHandler: { characters in
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.characters = characters
                self.charactersTableView.reloadData()
            }
        })
    }
    
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterName") as! CharacterTableViewCell
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        let characterInfo = CharacterInfoViewController.controller()
        characterInfo.character = character
        present(characterInfo, animated: true, completion: nil)
    }
}
