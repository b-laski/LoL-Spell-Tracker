//
//  SpectatorViewModelTest.swift
//  LoL Spell TrackerTests
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Quick
import Nimble
import Moya
import Mockingjay

@testable import LoL_Spell_Tracker

class SpectatorViewModelTest: QuickSpec {
    override func spec() {
        describe("SpectatorViewModel Test") {
            
            let body: [Int: [String: [String: Any]]] =
                [
                    400: ["status": ["status_code": 400, "message": "Bad Request - Exception decrypting"]],
                    401: ["status": ["status_code": 401, "message": "Unauthorized"]],
                    403: ["status": ["status_code": 403, "message": "Forbidden"]],
                    404: ["status": ["status_code": 404, "message": "Data not found - summoner not found"]],
                    405: ["status": ["status_code": 405, "message": "Method not allowed"]],
                    415: ["status": ["status_code": 405, "message": "Unsupported media type"]],
                    429: ["status": ["status_code": 429, "message": "Rate limit exceeded"]],
                    500: ["status": ["status_code": 500, "message": "Internal server error"]],
                    502: ["status": ["status_code": 502, "message": "Bad gateway"]],
                    503: ["status": ["status_code": 503, "message": "Service unavailable"]],
                    504: ["status": ["status_code": 504, "message": "Gateway timeout"]],
            ]
            
            beforeEach {
                let bundle = Bundle(for: type(of: self)).path(forResource: "SummonerJsonModel", ofType: "json")!
                let json = try! Data(contentsOf: URL(fileURLWithPath: bundle))
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/Pt849emcH5YvWSniZijITtpkgIHxP0s0QfV2nyw1rY_K4w8"),
                          jsonData(json, status: 200))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/400"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[400]!, options: .prettyPrinted), status: 400))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/401"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[401]!, options: .prettyPrinted), status: 401))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/403"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[403]!, options: .prettyPrinted), status: 403))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/404"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[404]!, options: .prettyPrinted), status: 404))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/405"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[405]!, options: .prettyPrinted), status: 405))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/415"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[415]!, options: .prettyPrinted), status: 415))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/429"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[429]!, options: .prettyPrinted), status: 429))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/500"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[500]!, options: .prettyPrinted), status: 500))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/502"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[502]!, options: .prettyPrinted), status: 502))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/503"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[503]!, options: .prettyPrinted), status: 503))
                
                self.stub(http(.get, uri: "https://eun1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/504"),
                          jsonData(try! JSONSerialization.data(withJSONObject: body[504]!, options: .prettyPrinted), status: 504))
            }
            
            it("get spectator info", closure: {
                let viewModel = SpectatorViewModel()
                
                viewModel.getSpectatorInfo("Pt849emcH5YvWSniZijITtpkgIHxP0s0QfV2nyw1rY_K4w8", complete: { (error) in
                    if error != nil {
                        NSLog("\(error?.localizedDescription ?? "")")
                        expect(error).to(beNil())
                    }
                })
                expect(viewModel.specatorModel).toEventuallyNot(beNil(), timeout: 10)
            })
            
            it("get spectator_error(400)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("400", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(400), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[400]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(401)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("401", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(401), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[401]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(403)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("403", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(403), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[403]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(404)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("404", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(404), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[404]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(405)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("405", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(405), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[405]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(415)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("415", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(415), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[415]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(429)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("429", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(429), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[429]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(500)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("500", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(500), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[500]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(502)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("502", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(502), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[502]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(503)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("503", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(503), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[503]!["status"]!["message"] as? String), timeout: 10)
            })
            
            it("get spectator_error(504)", closure: {
                let viewModel = SpectatorViewModel()
                var errorHandler: MoyaError?
                
                viewModel.getSpectatorInfo("504", complete: { (error) in
                    if error != nil {
                        expect(error).toNot(beNil())
                    }
                    
                    errorHandler = error
                })
                
                expect(errorHandler).toEventuallyNot(beNil(), timeout: 10)
                expect(errorHandler).toEventually(beAKindOf(MoyaError.self), timeout: 10)
                expect(errorHandler?.response?.statusCode).toEventually(equal(504), timeout: 10)
                expect(errorHandler?.response?.toErrorModel()?.message).toEventually(equal(body[504]!["status"]!["message"] as? String), timeout: 10)
            })
        }
    }
}
