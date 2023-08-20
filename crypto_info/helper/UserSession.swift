//
//  UserSession.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 18/8/2566 BE.
//

import Foundation
import UIKit

class UserSession {
    
    static let shared = UserSession()
    static let cryptoData = "cryptoData"
    static let cryptoYesterdayHistoryData = "cryptoYesterdayHistoryData"
    static let cryptoHistoryData = "cryptoHistoryData"
    
    //MARK: Crypto data
    func setCryptoDataString(string: String) {
        UserDefaults.standard.set(string, forKey: UserSession.cryptoData)
        UserDefaults.standard.synchronize()
    }
    
    func getCryptoData() -> [CryptocurrencyEntity]? {
        var cryptoData: [CryptocurrencyEntity] = []
        
        if let cryptoDataString = UserDefaults.standard.string(forKey: UserSession.cryptoData) {
            if let jsonResult = cryptoDataString.dictionary() {
                if let json = MessageResponse.from(jsonResult) {
                    if let cryptoArray = json.dataArray {
                        for data in cryptoArray {
                            if let crypto = CryptocurrencyEntity.from(data) {
                                if crypto.isEthereum != "" {
                                    cryptoData.append(crypto)
                                }
                            }
                        }
                        return cryptoData
                    }
                }
            }
        }
        return nil
    }
    
    //MARK: Crypto yesterday history data
    func setCryptoYesterdayHistoryDataString(string: String) {
        UserDefaults.standard.set(string, forKey: UserSession.cryptoYesterdayHistoryData)
        UserDefaults.standard.synchronize()
    }
    
    func getCryptoYesterdayHistoryData() -> CryptoHistoryEntity? {
        if let cryptoDataString = UserDefaults.standard.string(forKey: UserSession.cryptoYesterdayHistoryData) {
            if let jsonResult = cryptoDataString.dictionary() {
                if let historyData = CryptoHistoryEntity.from(jsonResult) {
                    return historyData
                }
            }
        }
        return nil
    }
    
    //MARK: Crypto history data
    func setCryptoHistoryDataString(string: String) {
        UserDefaults.standard.set(string, forKey: UserSession.cryptoHistoryData)
        UserDefaults.standard.synchronize()
    }
    
    func getCryptoHistoryData() -> CryptoHistoryEntity? {
        if let cryptoDataString = UserDefaults.standard.string(forKey: UserSession.cryptoHistoryData) {
            if let jsonResult = cryptoDataString.dictionary() {
                if let historyData = CryptoHistoryEntity.from(jsonResult) {
                    return historyData
                }
            }
        }
        return nil
    }
    
}
