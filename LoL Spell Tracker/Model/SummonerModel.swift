//
//  SummonerModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

struct SummonerModel: Codable {
    let profileIconID: Int?
    let name, puuid: String?
    let summonerLevel: Int?
    let accountID, id: String?
    let revisionDate: Int?
    
    enum CodingKeys: String, CodingKey {
        case profileIconID = "profileIconId"
        case name, puuid, summonerLevel
        case accountID = "accountId"
        case id, revisionDate
    }
}
