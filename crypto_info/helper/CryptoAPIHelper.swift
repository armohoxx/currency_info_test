//
//  CryptoAPIHelper.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation
import Moya

var instanceCryptoAPIHelper: CryptoAPIHelper? = nil

class CryptoAPIHelper {
    
    static func sharedInstance() -> CryptoAPIHelper {
        
        if instanceCryptoAPIHelper == nil {
            instanceCryptoAPIHelper = CryptoAPIHelper()
        }
        
        return instanceCryptoAPIHelper!
    }
    
    func fetchCryptoListsAPI(completion: @escaping (_ statusFetchCryptoListsAPI: String) -> Void) {
        
        NetworkAdapter.request(target: .FetchCryptoCurrency, success: { (response) in
            do {
                let json = try response.mapJSON() as! [NSDictionary]
                var dict = [String: AnyObject]()
                dict["data"] = json as AnyObject
                let jsonResultString = dict.dictionaryToString ?? ""
                
                //print("jsonResultString crypto data = ", jsonResultString)
                
                UserSession.shared.setCryptoDataString(string: jsonResultString)
                completion("ok")
            } catch let error {
                let errorStatusCode = (error as? MoyaError)?.response?.statusCode
                if errorStatusCode == 401 {
                    completion("401")
                } else {
                    let code = error.errorCode
                    let message = error.localizedDescription
                    let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                    if code == 6 || message.contains("\(localizedCancelled)") {
                        completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                    }else {
                        completion("\(ErrorAPI.ErrorExecute.rawValue)")
                    }
                }
            }
        }) { (error) in
            let errorStatusCode = (error as? MoyaError)?.response?.statusCode
            if errorStatusCode == 401 {
                completion("401")
            } else {
                let code = error.errorCode
                let message = error.localizedDescription
                let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                if code == 6 || message.contains("\(localizedCancelled)") {
                    completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                }else {
                    completion("\(ErrorAPI.ErrorExecute.rawValue)")
                }
            }
        }
    }
    
    func fetchCryptoYesterdayHistoryAPI(id: String, date: String, localization: String, completion: @escaping (_ statusFetchCryptoHistoryAPI: String) -> Void) {
        
        NetworkAdapter.request(target: .FecthHistoryCryptoCurrency(id: id, date: date, localization: localization), success: { (response) in
            do {
                let json = try response.mapJSON() as! NSDictionary
                let jsonResultString = json.dictionaryToString ?? ""
                
                //print("jsonResultString crypto yesterday history data = ", jsonResultString)
                
                UserSession.shared.setCryptoYesterdayHistoryDataString(string: jsonResultString)
                completion("ok")
            } catch let error {
                let errorStatusCode = (error as? MoyaError)?.response?.statusCode
                if errorStatusCode == 401 {
                    completion("401")
                } else {
                    let code = error.errorCode
                    let message = error.localizedDescription
                    let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                    if code == 6 || message.contains("\(localizedCancelled)") {
                        completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                    }else {
                        completion("\(ErrorAPI.ErrorExecute.rawValue)")
                    }
                }
            }
        }) { (error) in
            let errorStatusCode = (error as? MoyaError)?.response?.statusCode
            if errorStatusCode == 401 {
                completion("401")
            } else {
                let code = error.errorCode
                let message = error.localizedDescription
                let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                if code == 6 || message.contains("\(localizedCancelled)") {
                    completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                }else {
                    completion("\(ErrorAPI.ErrorExecute.rawValue)")
                }
            }
        }
    }
    
    func fetchCryptoHistoryAPI(id: String, date: String, localization: String, completion: @escaping (_ statusFetchCryptoHistoryAPI: String) -> Void) {
        
        NetworkAdapter.request(target: .FecthHistoryCryptoCurrency(id: id, date: date, localization: localization), success: { (response) in
            do {
                let json = try response.mapJSON() as! NSDictionary
                let jsonResultString = json.dictionaryToString ?? ""
                
                //print("jsonResultString crypto history data = ", jsonResultString)
                
                UserSession.shared.setCryptoHistoryDataString(string: jsonResultString)
                completion("ok")
            } catch let error {
                let errorStatusCode = (error as? MoyaError)?.response?.statusCode
                if errorStatusCode == 401 {
                    completion("401")
                } else {
                    let code = error.errorCode
                    let message = error.localizedDescription
                    let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                    if code == 6 || message.contains("\(localizedCancelled)") {
                        completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                    }else {
                        completion("\(ErrorAPI.ErrorExecute.rawValue)")
                    }
                }
            }
        }) { (error) in
            let errorStatusCode = (error as? MoyaError)?.response?.statusCode
            if errorStatusCode == 401 {
                completion("401")
            } else {
                let code = error.errorCode
                let message = error.localizedDescription
                let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                if code == 6 || message.contains("\(localizedCancelled)") {
                    completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                }else {
                    completion("\(ErrorAPI.ErrorExecute.rawValue)")
                }
            }
        }
    }
    
}
