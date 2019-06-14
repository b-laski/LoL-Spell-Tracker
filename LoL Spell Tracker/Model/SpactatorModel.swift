//
//  SpactatorModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

struct SpactatorModel: Codable {
    let gameID, gameStartTime: Int?
    let platformID, gameMode: String?
    let mapID: Int?
    let gameType: String?
    let gameQueueConfigID: Int?
    let observers: ObserversModel?
    let participants: [ParticipantModel]?
    let gameLength: Int?
    let bannedChampions: [BannedChampionModel]?
    
    enum CodingKeys: String, CodingKey {
        case gameID = "gameId"
        case gameStartTime
        case platformID = "platformId"
        case gameMode
        case mapID = "mapId"
        case gameType
        case gameQueueConfigID = "gameQueueConfigId"
        case observers, participants, gameLength, bannedChampions
    }
}
