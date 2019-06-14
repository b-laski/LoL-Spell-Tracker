//
//  ErrorModel.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 14/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

struct ErrorModel: Codable {
    let statusCode: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message
    }
}
