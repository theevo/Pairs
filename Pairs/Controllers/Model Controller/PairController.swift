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
    
    
    // MARK: - Initializer
    
    init() {
        loadMockData()
    }
    
    
    // MARK: - Helpers
    func loadMockData() {
        persons = [ Person(name: "Theo Vora"),
                    Person(name: "Garrett Lyons"),
                    Person(name: "Dwight Wong")
        ]
    }
}
