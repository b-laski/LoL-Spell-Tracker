//
//  Response.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 14/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

extension Response {
    internal func toErrorModel() -> ErrorModel? {
        do {
           return try self.map(ErrorModel.self, atKeyPath: "status", using: JSONDecoder())
        } catch {
            return nil
        }
    }
}
