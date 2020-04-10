//
//  PairController.swift
//  Pairs
//
//  Created by Theo Vora on 4/10/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import Foundation

class PairController {
    
    // MARK: - Shared Instance
    
    static let shared: PairController = PairController()
    
    
    // MARK: - Properties
    
    var persons: [Person] = []
    var numberOfPairs: Int {
        get {
            return (persons.count / 2) + 1
        }
    }
    
    
    // MARK: - Initializer
    
    init() {
//        loadMockData()
        loadFromPersistence()
//        saveToPersistentStorage(persons: persons)
    }
    
    
    // MARK: - Helpers
    func loadMockData() {
        persons = [ Person(name: "Theo Vora"),
                    Person(name: "Garrett Lyons"),
                    Person(name: "Dwight Wong")
        ]
    }
    
    
    
    
    //MARK: - Persistence

    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "Pairs.json"
        let documentDirectory = urls[0]
        let documentsDirectoryURL = documentDirectory.appendingPathComponent(fileName)
        return documentsDirectoryURL
    }

    func saveToPersistentStorage(persons: [Person]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(persons)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }

    func loadFromPersistence() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedData = try jsonDecoder.decode([Person].self, from: data)
            self.persons = decodedData
        } catch let error {
            print("\(error.localizedDescription) -> \(error)")
        }
    }

}
