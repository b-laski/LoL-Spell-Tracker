//
//  BannedChampionModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

struct BannedChampionModel: Codable {
    let teamID, championID, pickTurn: Int?
    
    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case championID = "championId"
        case pickTurn
    }
}
