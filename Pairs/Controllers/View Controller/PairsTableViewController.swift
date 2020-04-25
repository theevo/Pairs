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
        return PairController.shared.numberOfPairs
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PairController.shared.oddPersons &&
            (section == PairController.shared.numberOfPairs - 1) ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pair \(section + 1)"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = PairController.shared.pairs[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = person.name

        return cell
    }

}
