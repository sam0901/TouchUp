//
//  HomePageCategoryWidgetCell.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-20.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit

class HomePageCategoryWidgetCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selected = false
    }
    
    override var selected : Bool {
        didSet {
           self.backgroundColor = selected ? themeColorWithAlpha : themeColor
        }
    }
}
