//
//  CryptoDetailViewController.swift
//  crypto_info
//
//  Created Phattarapon Jungtakarn on 18/8/2566 BE.
//  Copyright © 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class CryptoDetailViewController: UIViewController {

	var presenter: CryptoDetailPresenterProtocol?
    var nameCrypto: String = "-"

    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var prevPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var percentChangePriceLabel: UILabel!
    
    @IBOutlet weak var prevMarketCapLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var percentChangeMarketCapLabel: UILabel!
    
    @IBOutlet weak var prevVolumeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var percentChangeVolumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI() {
        self.setupNavbar()
        self.viewContainer.layer.cornerRadius = 15
        self.viewContainer.layer.borderWidth = 1
        self.viewContainer.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupNavbar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = self.nameCrypto
        
        let imageBack = UIImage(named: "ic_back_blue")?.tinted(with: UIColor.black)
        
        let leftBarButton = UIBarButtonItem(
            image: imageBack?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(onClickBackButton)
        )
        
        leftBarButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25.0),
            NSAttributedString.Key.foregroundColor : UIColor.gray,
        ], for: .normal)
        
        self.navigationItem.leftBarButtonItems = [leftBarButton]
    }
    
    @objc func onClickBackButton() {
        self.presenter?.notifyRouteToMain()
    }
    
    func checkCanDisplayPrice(historyData: CryptoHistoryDisplayEntity) {
        if historyData.pervious_price.isNaN {
            self.prevPriceLabel.text = "N/A"
        } else {
            self.prevPriceLabel.text = "\(historyData.pervious_price)" + "$"
        }
        
        if historyData.price.isNaN {
            self.priceLabel.text = "N/A"
        } else {
            self.priceLabel.text = "\(historyData.price)" + "$"
        }
        
        if historyData.percent_change_price.isNaN {
            self.percentChangePriceLabel.text = "N/A"
        } else {
            self.percentChangePriceLabel.text = "\(historyData.percent_change_price)" + "%"
        }
    }
    
    func checkCanDisplayMarketCap(historyData: CryptoHistoryDisplayEntity) {
        if historyData.pervious_market_cap.isNaN {
            self.prevMarketCapLabel.text = "N/A"
        } else {
            self.prevMarketCapLabel.text = "\(historyData.pervious_market_cap)" + "$"
        }
        
        if historyData.market_cap.isNaN {
            self.marketCapLabel.text = "N/A"
        } else {
            self.marketCapLabel.text = "\(historyData.market_cap)" + "$"
        }
        
        if historyData.percent_market_cap.isNaN {
            self.percentChangeMarketCapLabel.text = "N/A"
        } else {
            self.percentChangeMarketCapLabel.text = "\(historyData.percent_market_cap)" + "%"
        }
    }
    
    func checkCanDisplayVolume(historyData: CryptoHistoryDisplayEntity) {
        if historyData.pervious_volume.isNaN {
            self.prevVolumeLabel.text = "N/A"
        } else {
            self.prevVolumeLabel.text = "\(historyData.pervious_volume)" + "$"
        }
        
        if historyData.volume.isNaN {
            self.volumeLabel.text = "N/A"
        } else {
            self.volumeLabel.text = "\(historyData.volume)" + "$"
        }
        
        if historyData.percent_volume.isNaN {
            self.percentChangeVolumeLabel.text = "N/A"
        } else {
            self.percentChangeVolumeLabel.text = "\(historyData.percent_volume)" + "%"
        }
    }
    
    func checkDisplayColorText(historyData: CryptoHistoryDisplayEntity) {
        if let percentChangePriceIsNegative = self.presenter?.checkIsNegative(value: historyData.percent_change_price) as? Bool,
           let percentChangeMarketCapIsNegative = self.presenter?.checkIsNegative(value: historyData.percent_market_cap),
           let percentChangeVolumeIsNegative = self.presenter?.checkIsNegative(value: historyData.percent_volume) {
            
            if percentChangePriceIsNegative {
                self.percentChangePriceLabel.textColor = UIColor.red
            } else {
                self.percentChangePriceLabel.textColor = UIColor.green
            }
            
            if percentChangeMarketCapIsNegative {
                self.percentChangeMarketCapLabel.textColor = UIColor.red
            } else {
                self.percentChangeMarketCapLabel.textColor = UIColor.green
            }
            
            if percentChangeVolumeIsNegative {
                self.percentChangeVolumeLabel.textColor = UIColor.red
            } else {
                self.percentChangeVolumeLabel.textColor = UIColor.green
            }
        } else {
            self.displayAlert(title: "Alert!", message: "Something Wrong.")
        }
    }
    
}

extension CryptoDetailViewController: CryptoDetailViewProtocol {
    
    func displayHeaderNameCrypto(name: String) {
        self.nameCrypto = name
    }
    
    func displayHistoryCryptoData(historyData: CryptoHistoryDisplayEntity) {
        self.checkCanDisplayPrice(historyData: historyData)
        self.checkCanDisplayMarketCap(historyData: historyData)
        self.checkCanDisplayVolume(historyData: historyData)
        self.checkDisplayColorText(historyData: historyData)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
