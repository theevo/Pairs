//
//  PairsTableViewController.swift
//  Pairs
//
//  Created by Theo Vora on 4/10/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import UIKit

class PairsTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PairController.shared.persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = PairController.shared.persons[indexPath.row]
        
        cell.textLabel?.text = person.name

        return cell
    }

}
