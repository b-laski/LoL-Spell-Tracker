//
//  ParticipantModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

struct ParticipantModel: Codable {
    let profileIconID, championID: Int?
    let summonerName: String?
    //let gameCustomizationObjects: [Any]?
    let bot: Bool?
    let perks: PerksModel?
    let spell2ID, teamID, spell1ID: Int?
    let summonerID: String?
    
    enum CodingKeys: String, CodingKey {
        case profileIconID = "profileIconId"
        case championID = "championId"
        case summonerName, bot, perks
        case spell2ID = "spell2Id"
        case teamID = "teamId"
        case spell1ID = "spell1Id"
        case summonerID = "summonerId"
    }
}
