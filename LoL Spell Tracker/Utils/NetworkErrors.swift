//
//  NetworkErrors.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Foundation

enum NetworkErrors {
    case BadRequest
    case Unauthorized
    case Forbidden
    case DataNotFound
    case MethodNotAllowed
    case UnsupportedMediaType
    case RateLimitExceeded
    case InternalServerError
    case BadGateway
    case ServiceUnavailable
    case GatewayTimeout
}
