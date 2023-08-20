//
//  CryptoHistoryDisplayEntity.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 21/8/2566 BE.
//

import Foundation

class CryptoHistoryDisplayEntity: Encodable {
    var pervious_price: Double
    var price: Double
    var percent_change_price: Double
    var pervious_market_cap: Double
    var market_cap: Double
    var percent_market_cap: Double
    var pervious_volume: Double
    var volume: Double
    var percent_volume: Double
    
    init(pervious_price: Double,
        price: Double,
        percent_change_price: Double,
        pervious_market_cap: Double,
        market_cap: Double,
        percent_market_cap: Double,
        pervious_volume: Double,
        volume: Double,
        percent_volume: Double) {
        self.pervious_price = pervious_price
        self.price = price
        self.percent_change_price = percent_change_price
        self.pervious_market_cap = pervious_market_cap
        self.market_cap = market_cap
        self.percent_market_cap = percent_market_cap
        self.pervious_volume = pervious_volume
        self.volume = volume
        self.percent_volume = percent_volume
    }
    
}
