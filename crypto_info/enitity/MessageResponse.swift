//
//  MessageResponse.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 20/8/2566 BE.
//

import Foundation
import Mapper

class MessageResponse: NSObject, Mappable {
    
    var status: String
    var dataArray: [NSDictionary]?
    var data: NSDictionary?
    var accessArray: [NSDictionary]?
    
    required init(map: Mapper) throws {
        self.status = map.optionalFrom("status") ?? ""
        self.dataArray = map.optionalFrom("data")
        self.data = map.optionalFrom("data")
        self.accessArray = map.optionalFrom("access")
    }
    
}
