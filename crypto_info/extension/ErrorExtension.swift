//
//  ErrorExtension.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation

extension Error {
    
    var errorCode:Int? {
        return (self as NSError).code
    }
    
}
