//
//  PerksModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

struct PerksModel: Codable {
    let perkStyle: Int?
    let perkIDS: [Int]?
    let perkSubStyle: Int?
    
    enum CodingKeys: String, CodingKey {
        case perkStyle
        case perkIDS = "perkIds"
        case perkSubStyle
    }
}
