//
//  CryptoHistoryEntity.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 20/8/2566 BE.
//

import Mapper

class CryptoHistoryEntity: NSObject, Mappable {
    
    var id: String
    var symbol: String
    var name: String
    var current_price: Double
    var market_cap: Double
    var total_volume: Double
        
    required init(map: Mapper) throws {
        self.id = map.optionalFrom("id") ?? ""
        self.symbol = map.optionalFrom("symbol") ?? ""
        self.name = map.optionalFrom("name") ?? ""
        self.current_price = map.optionalFrom("market_data.current_price.usd") ?? 0.00
        self.market_cap = map.optionalFrom("market_data.market_cap.usd") ?? 0.00
        self.total_volume = map.optionalFrom("market_data.total_volume.usd") ?? 0.00
    }
    
}
