//
//  CryptoAPI.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation
import Moya
import SwiftyJSON

enum CryptoAPI {
    case FetchCryptoCurrency
    case FecthHistoryCryptoCurrency(id: String, date: String, localization: String)
}

extension CryptoAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: url)!
    }
    
    var url: String {
        switch self {
            
        case .FetchCryptoCurrency:
            return Constants.DefaultAPIURL
            
        case .FecthHistoryCryptoCurrency:
            return Constants.DefaultAPIURL
        }
    }
    
    var path: String{
        switch self {
            
        case .FetchCryptoCurrency:
            return "/api/v3/coins/list"
            
        case let .FecthHistoryCryptoCurrency(id, _, _):
            return "/api/v3/coins/\(id)/history"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .FetchCryptoCurrency:
            return .get
            
        case .FecthHistoryCryptoCurrency:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .FetchCryptoCurrency:
            var parameters = [String: Any]()
            parameters["include_platform"] = "true"
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case let .FecthHistoryCryptoCurrency(_, date, localization):
            var parameters = [String: Any]()
            parameters["date"] = date
            parameters["localization"] = localization
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .FetchCryptoCurrency,
             .FecthHistoryCryptoCurrency:
            return [
                "Content-Type": "application/json",
            ]
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    
}
