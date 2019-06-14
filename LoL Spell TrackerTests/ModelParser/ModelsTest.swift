//
//  ModelTests.swift
//  LoL Spell TrackerTests
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Quick
import Nimble

@testable import LoL_Spell_Tracker

class SummonerModelTest: QuickSpec {
    override func spec() {
        describe("Summoner Model Test") {
            let bundle = Bundle(for: type(of: self))
            let path = bundle.path(forResource: "SummonerJsonModel", ofType: "json")
            
            it("File is exist", closure: {
                expect(path?.isEmpty).to(equal(false))
            })
            
            it("Parse json to model", closure: {
                do {
                    let url = URL(fileURLWithPath: path!)
                    let json = try Data(contentsOf: url)
                    
                    let decode = JSONDecoder()
                    let model = try decode.decode(SummonerModel.self, from: json)
                    
                    expect(model.profileIconID).to(equal(3551))
                    expect(model.name).to(equal("o0xymoron"))
                    expect(model.puuid).to(equal("FlTzRk-vcgQjNeWOrP8XIcE-KRyd20kKqzFPQgWRY1J2X7nNh2eUtLHeUdcV5xD-3uhgQSg8xj0bbg"))
                    expect(model.summonerLevel).to(equal(88))
                    expect(model.accountID).to(equal("cfSUXZeZkvxtSbXXryQ0jo1m1Izd1m64_LmhUIvWH1gD7w"))
                    expect(model.id).to(equal("Pt849emcH5YvWSniZijITtpkgIHxP0s0QfV2nyw1rY_K4w8"))
                    expect(model.revisionDate).to(equal(1558113360000))
                    
                } catch let error {
                    expect(error.localizedDescription).notTo(equal(nil))
                }
            })
        }
    }
}

class SpactatorModelTest: QuickSpec {
    override func spec() {
        describe("Spectator Model Test") {
            let bundle = Bundle(for: type(of: self))
            let path = bundle.path(forResource: "SpectatorJsonModel", ofType: "json")
            
            it("File is exist", closure: {
                expect(path?.isEmpty).to(equal(false))
            })
            
            it("Parse json to model", closure: {
                do {
                    let url = URL(fileURLWithPath: path!)
                    let json = try Data(contentsOf: url)
                    
                    let decode = JSONDecoder()
                    let model = try decode.decode(SpactatorModel.self, from: json)
                    
                    expect(model.gameID).to(equal(2200039102))
                    expect(model.gameStartTime).to(equal(1560193772944))
                    expect(model.platformID).to(equal("EUN1"))
                    expect(model.gameMode).to(equal("CLASSIC"))
                    expect(model.mapID).to(equal(11))
                    expect(model.gameType).to(equal("MATCHED_GAME"))
                    expect(model.gameQueueConfigID).to(equal(400))
                    expect(model.observers?.encryptionKey).to(equal("ts/mmHClm6MUyR50sB8XdM2bleKnSGZE"))
                    expect(model.gameType).to(equal("MATCHED_GAME"))
                    expect(model.participants?.isEmpty).notTo(equal(true))
                    
                    let participant = model.participants![0]
                    expect(participant.profileIconID).to(equal(4027))
                    expect(participant.championID).to(equal(45))
                    expect(participant.summonerName).to(equal("Bolgumil"))
                    expect(participant.bot).to(equal(false))
                    expect(participant.spell2ID).to(equal(4))
                    expect(participant.spell1ID).to(equal(7))
                    expect(participant.teamID).to(equal(100))
                    expect(participant.summonerID).to(equal("iAiP97pth44n4m3noAkfM4vUxJ3lo9ppwXhQobyULCHm4K0"))
                    
                    let perk = participant.perks!
                    expect(perk.perkStyle).to(equal(8100))
                    expect(perk.perkIDS?.count).notTo(equal(0))
                    
                } catch let error {
                    expect(error.localizedDescription).notTo(equal(nil))
                }
            })
        }
    }
}
