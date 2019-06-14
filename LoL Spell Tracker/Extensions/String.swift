//
//  String.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
