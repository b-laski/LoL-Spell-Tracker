//
//  SummonerViewModelTests.swift
//  LoL Spell TrackerTests
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Quick
import Nimble
import Moya
import Mockingjay

@testable import LoL_Spell_Tracker

class SummonerViewModelTests: QuickSpec {
    override func spec() {
        describe("SummonerViewModel Test") {
            
            beforeEach {
                let bundle = Bundle(for: type(of: self)).path(forResource: "SummonerJsonModel", ofType: "json")!
                let json = try! Data(contentsOf: URL(fileURLWithPath: bundle))
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/summoner/v4/summoners/by-name/o0xymoron"), jsonData(json, status: 200))
                
                let body = ["status": ["status_code": 400, "message": "Bad Request - Exception decrypting"]]
                let jsonError = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/summoner/v4/summoners/by-name/400"), jsonData(jsonError, status: 400))
            }
            
            it("get summoner", closure: {
                let viewModel = SummonerViewModel()
                
                viewModel.getSummoner("o0xymoron", complete: { (error) in
                    if error != nil {
                        NSLog("\(error?.localizedDescription ?? "")")
                        expect(error).to(beNil())
                    }
                })
                expect(viewModel.summoner).toEventuallyNot(beNil(), timeout: 10)
            })
            
            it("get summoner_bad_request(400)", closure: {
                let viewModel = SummonerViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSummoner("400", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(400), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal("Bad Request - Exception decrypting"))
            })
        }
    }
}
