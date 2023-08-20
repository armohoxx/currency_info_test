//
//  DoubleExtension.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 21/8/2566 BE.
//

import Foundation

extension Double {
    
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
