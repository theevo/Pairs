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
            let half = persons.count / 2
            return oddPersons ? half + 1 : half
        }
    }
    var oddPersons: Bool {
        get {
            persons.count % 2 == 1
        }
    }
    var pairs: [[Person]] {
        get {
            var pairs = [[Person]]()
            var section = 0
            var row = 0
            
            for person in persons {
                if row == 0 {
                    
                    // this is a new section!
                    
                    var sectionArray = [Person]() // create the subarray
                    sectionArray.append(person)
                    pairs.append(sectionArray)
                    row = 1
                } else {
                    
                    // the section is already there. just add the thing.
                    
                    var sectionArray = pairs[section]
                    sectionArray.append(person)
                    pairs[section] = sectionArray // replace what's there
                    
                    section += 1
                    row = 0
                }
            }
            
            return pairs
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
    
    
    // MARK: - CRUD
    
    func add(personByName: String) {
        let newPerson = Person(name: personByName)
        persons.append(newPerson)
        
        saveToPersistentStorage(persons: persons)
    }
    
    func randomize() {
        persons.shuffle()
        
        saveToPersistentStorage(persons: persons)
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
