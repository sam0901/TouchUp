//
//  HomeCategoryWidgetCollectionViewController.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-20.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit

class HomeCategoryWidgetCollectionViewController: UICollectionViewController {
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
        let rect = cell.bounds
        let view = UIView.init(frame: rect)
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.25)
        cell.addSubview(view)
        collectionView.bringSubviewToFront(cell.categoryCellLabel)
        return cell
    }
    
}