//
//  Enum.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation

enum ErrorAPI: String {
    case ErrorCancelled = "cancelled"
    case ErrorExecute = "execute_database_fail"
}

enum ConstraintNewsPage: Int {
    case DefaultSizeCell
    case DefaultConstraintLeftRight
    
    var cgFloatValue: CGFloat {
        switch self {
        case .DefaultSizeCell: return 50
        case .DefaultConstraintLeftRight: return 10
        }
    }
}

