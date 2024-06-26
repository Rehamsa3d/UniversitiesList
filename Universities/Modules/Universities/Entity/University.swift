//
//  University.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var alphaTwoCode: String?
    var webPages = List<String>()
    @objc dynamic var country: String?
    var domains = List<String>()

    @objc dynamic var stateProvince: String?

    
    private enum CodingKeys: String, CodingKey {
        case name
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case country
        case domains
        case stateProvince = "state-province"
    }
    
    
    // MARK: Primary Key
    
    override public static func primaryKey() -> String? {
        "name"
    }
}

