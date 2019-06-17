//
//  SpectatorViewModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

public class SpectatorViewModel {
    internal var spectatorProvider = MoyaProvider<SpectatorProvider>(plugins: [NetworkLoggerPlugin(verbose: true)])
    internal var specatorModel: SpectatorModel?
    
    public func getSpectatorInfo(_ summonerId: String, complete: @escaping (MoyaError?) -> Void) {
        spectatorProvider.request(.getSpecator(summonerId)) { (result) in
            switch result {
            case .success(let value):
                do {
                    let json = try value.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    self.specatorModel = try json.map(SpectatorModel.self, atKeyPath: nil, using: decoder)
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
