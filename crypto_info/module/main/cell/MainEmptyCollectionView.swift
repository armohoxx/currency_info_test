//
//  MainEmptyCollectionView.swift
//  crypto_info
//
//  Created by Phattarapon Jungtakarn on 20/8/2566 BE.
//

import UIKit

class MainEmptyCollectionView: UICollectionView {
    
    var emptyLabel: UILabel = UILabel()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initUI()
    }
    
    func initUI(){
        self.addSubview(self.emptyLabel)
        self.display(title: "Please wait")
    }
    
    func display(title: String){
        let titleHeight = title.heightWithConstrainedWidth(width: frame.size.width - 100, font: UIFont.systemFont(ofSize: 22))
        self.emptyLabel.text = NSLocalizedString(title, comment: "")
        let titleX = (frame.size.width/2) - (frame.size.width - 100)/2
        self.emptyLabel.frame = CGRect.init(x: titleX , y: frame.size.height/2 - titleHeight/2, width: frame.size.width - 100, height: titleHeight)
        self.emptyLabel.textColor = UIColor.black
        self.emptyLabel.textAlignment = .center
        self.emptyLabel.numberOfLines = 0
        self.emptyLabel.lineBreakMode = .byWordWrapping
        self.emptyLabel.font = UIFont.systemFont(ofSize: 18)
        self.emptyLabel.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.emptyLabel.backgroundColor = UIColor.clear
        self.emptyLabel.setNeedsDisplay()
        self.emptyLabel.setNeedsLayout()
    }
    
    func displayMessageAndOnClick(title: String,onClickMessage: String){

        self.emptyLabel.text = title
        let underlineAttriString = NSMutableAttributedString(string: title)
        let range = (title as NSString).range(of: onClickMessage)
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.blue, range: range)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: range)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 18), range: range)
        self.emptyLabel.attributedText = underlineAttriString
        self.emptyLabel.isUserInteractionEnabled = true
        
        let titleHeight = title.heightWithConstrainedWidth(width: frame.size.width - 100, font: UIFont.systemFont(ofSize: 22))
        let titleX = (frame.size.width/2) - (frame.size.width - 100)/2
        self.emptyLabel.frame = CGRect.init(x: titleX , y: frame.size.height/2 - titleHeight/2, width: frame.size.width - 100, height: titleHeight)
        self.emptyLabel.textAlignment = .center
        self.emptyLabel.numberOfLines = 0
        self.emptyLabel.lineBreakMode = .byWordWrapping
        self.emptyLabel.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.emptyLabel.backgroundColor = UIColor.clear
        self.emptyLabel.setNeedsDisplay()
        self.emptyLabel.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemsInFirstSection = self.dataSource?.collectionView(self, numberOfItemsInSection: 1) ?? 0
        let sections = self.dataSource?.numberOfSections?(in: self) ?? 0
        var checkItemsNotNil = false
        if sections > 0 || itemsInFirstSection > 0{
            checkItemsNotNil = true
        } else{
            checkItemsNotNil = false
        }
        self.emptyLabel.isHidden = checkItemsNotNil
    }
    
}

