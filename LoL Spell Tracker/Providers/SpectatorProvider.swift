//
//  SpectatorProvider.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

public enum SpectatorProvider {
    case getSpecator(String)
}

extension SpectatorProvider: TargetType {
    public var baseURL: URL {
        return URL(string: "https://eun1.api.riotgames.com")!
    }
    
    public var path: String {
        switch self {
        case .getSpecator(let summonerId):
            return "/lol/spectator/v4/active-games/by-summoner/\(summonerId)"
        }
    }
    
    public var method: Method {
        switch self {
        case .getSpecator:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .getSpecator:
            return "".utf8Encoded
        }
    }
    
    public var task: Task {
        switch self {
        case .getSpecator:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [ "Origin": "https://developer.riotgames.com",
                 "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
                 "X-Riot-Token": "RGAPI-0199d4ba-1203-4fb8-ba50-c78fd4d38adc"
        ]
    }
}
