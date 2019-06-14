//
//  SummonerViewModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

public class SummonerViewModel {
    internal var summonerProvider = MoyaProvider<SummonerProvider>()
    internal var summoner: SummonerModel? = nil
    
    public func getSummoner(_ summonerName: String, complete: @escaping (MoyaError?) -> Void) {
        summonerProvider.request(.getSummoner(summonerName)) { (result) in
            switch result {
            case .success(let value):
                do {
                    let json = try value.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    self.summoner = try json.map(SummonerModel.self, atKeyPath: nil, using: decoder)
                    complete(nil)
                } catch let error {
                    print(error)
                    complete(error as? MoyaError)
                }
            case .failure(let error):
                print(error)
                complete(error)
            }
        }
    }
}
