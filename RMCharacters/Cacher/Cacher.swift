//
//  Cacher.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-11.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation

final public class Cacher {
    let destination: URL
    private let queue = OperationQueue()
    
    public enum CacheDestination {
        case temporary
        case atFolder(String)
    }
    
    public init(destination: CacheDestination) {
        switch destination {
        case .temporary:
            self.destination = URL(fileURLWithPath: NSTemporaryDirectory())
        case .atFolder(let folder):
            let documentFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            self.destination = URL(fileURLWithPath: documentFolder).appendingPathComponent(folder, isDirectory: true)
        }
        
        try? FileManager.default.createDirectory(at: self.destination, withIntermediateDirectories: true, attributes: nil)
    }
    
    public func persist(item: Cachable, completion: @escaping (_ url: URL?, _ error: Error?) -> Void) {
        var url: URL?
        var error: Error?
        
        let operation = BlockOperation {
            do {
                url = try self.persist(data: item.transform(), at: self.destination.appendingPathComponent(item.fileName, isDirectory: false))
            } catch let persistError {
                error = persistError
            }
        }
        
        operation.completionBlock = {
            completion(url, error)
        }
        
        queue.addOperation(operation)
    }
    
    public func load<T: Cachable & Codable>(fileName: String) -> T? {
        guard
            let data = try? Data(contentsOf: destination.appendingPathComponent(fileName, isDirectory: false)),
            let decoded = try? JSONDecoder().decode(T.self, from: data)
            else { return nil }
        return decoded
    }
    
    private func persist(data: Data, at url: URL) throws -> URL {
        do {
            try data.write(to: url, options: [.atomicWrite])
            return url
        } catch let error {
            throw error
        }
    }
}
