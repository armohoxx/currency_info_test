//
//  ResponseCode.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation
import Mapper

class ResponseCode: NSObject, Mappable {
    
    var code: Int
    var message: String?
    
    required init(map: Mapper) throws {
        self.code = try map.from("code")
        self.message = map.optionalFrom("message")
    }
    
}
