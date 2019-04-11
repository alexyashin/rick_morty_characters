//
//  CharactersAPI.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-07.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

class CharactersAPI {
    private let url = "https://rickandmortyapi.com/api/character"
    private let cacheFolder = "Characters"
    private let cacheFile = "List"
    
    func getCharacters(completionHandler: @escaping ([Character]) -> Void) {
        guard let gitUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else {
                let cachableCharacters: CachableCharacters? = Cacher(destination: .atFolder(self.cacheFolder)).load(fileName: self.cacheFile)
                completionHandler(cachableCharacters?.characters ?? [])
                return
            }
            do {
                let decoder = JSONDecoder()
                let charactersResponse = try decoder.decode(CharactersResponse.self, from: data)
                let characters = charactersResponse.results
                completionHandler(characters)
                let cachableCharacters = CachableCharacters(store: self.cacheFile, characters: characters)
                Cacher(destination: .atFolder(self.cacheFolder)).persist(item: cachableCharacters, completion: {_,_ in })
            } catch _ {
                let cachableCharacters: CachableCharacters? = Cacher(destination: .atFolder("Characters")).load(fileName: "List")
                completionHandler(cachableCharacters?.characters ?? [])
            }
        }.resume()
    }
}
