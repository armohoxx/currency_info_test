//
//  MainCell.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 20/8/2566 BE.
//

import UIKit

class MainCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }

    func initUI() {
        self.cellView.backgroundColor = UIColor.theme.backgroundNavbar
        self.cellView.layer.cornerRadius = 10
    }
    
    func displayCryptoLists(cryptoData: CryptocurrencyEntity) {
        self.nameLabel.text = cryptoData.name
    }
    
}
