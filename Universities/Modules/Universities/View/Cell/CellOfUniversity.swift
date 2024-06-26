//
//  CellOfUniversity.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import UIKit

class CellOfUniversity: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var university: University! {
        didSet {
            nameLabel.text = university?.name ?? ""
            countryLabel.text = university.country ?? ""
        }
    }
}
