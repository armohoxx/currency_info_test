//
//  CryptocurrencyEntity.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 20/8/2566 BE.
//

import Mapper

class CryptocurrencyEntity: NSObject, Mappable {
    
    var id: String
    var symbol: String
    var name: String
    var isEthereum: String?
        
    required init(map: Mapper) throws {
        self.id = map.optionalFrom("id") ?? ""
        self.symbol = map.optionalFrom("symbol") ?? ""
        self.name = map.optionalFrom("name") ?? ""
        self.isEthereum = map.optionalFrom("platforms.ethereum") ?? ""
    }
    
}
