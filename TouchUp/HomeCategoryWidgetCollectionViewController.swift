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
        return cell
    }
    
}