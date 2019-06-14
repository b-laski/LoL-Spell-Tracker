//
//  SummonerProvider.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

enum SummonerProvider {
    case getSummoner(String)
}

extension SummonerProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://eun1.api.riotgames.com")!
    }

    var path: String {
        switch self {
        case .getSummoner(let summonerName):
            return "/lol/summoner/v4/summoners/by-name/\(summonerName)"
        }
    }

    var method: Method {
        switch self {
        case .getSummoner:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .getSummoner:
            return "".utf8Encoded
        }
    }

    var task: Task {
        switch self {
        case .getSummoner:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return [ "Origin": "https://developer.riotgames.com",
                 "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
                 "X-Riot-Token": "RGAPI-ba5e91ee-899d-489c-912d-cdbde832726d"
        ]
    }
}

