//
//  HomeCategoryWidgetCollectionViewController.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-20.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit
//import CoreLocation

class HomeCategoryWidgetCollectionViewController: UICollectionViewController {
    
//    private var locationManager = CLLocationManager()
    
    private let reuseIdentifier = "HomeCategoryWidgetCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    private var widgets = HomePageBroker.init().widgets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomeCategoryWidgetCollectionViewController : UICollectionViewDelegateFlowLayout {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return widgets.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomePageCategoryWidgetCell
        cell.categoryCellLabel.text = widgets[indexPath.row].typeName
        cell.categoryCellLabel.textColor = UIColor.whiteColor()
        cell.categoryCellLabel.textAlignment = NSTextAlignment.Justified
        cell.categoryImageView.image = UIImage(named: widgets[indexPath.row].imageName!)
        cell.categoryBlurView.alpha = 0.10
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var height: CGFloat?
        if DeviceType.IS_IPHONE_6P {
            height = ScreenSize.SCREEN_HEIGHT - 500
        }
        if DeviceType.IS_IPHONE_6 {
            height = ScreenSize.SCREEN_HEIGHT - 440
        }
        if DeviceType.IS_IPHONE_5 {
            height = ScreenSize.SCREEN_HEIGHT - 380
        }
        if DeviceType.IS_IPHONE_4_OR_LESS {
            height = ScreenSize.SCREEN_HEIGHT - 300
        }
        if DeviceType.IS_IPAD {
            height = ScreenSize.SCREEN_HEIGHT - 600
        } else {
            height = 200
        }
        
        
        return CGSizeMake(ScreenSize.SCREEN_WIDTH - 20, height!)
    }
    
}