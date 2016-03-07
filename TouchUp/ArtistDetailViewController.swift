//
//  ArtistDetailViewController.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-03-04.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit
import MapKit

class ArtistDetailViewController: UIViewController {
    
    @IBOutlet weak var artistDetailImageView: UIImageView!
    @IBOutlet weak var artistDetailRatingLabel: UILabel!
    @IBOutlet weak var artistDetailDistanceLabel: UILabel!
    @IBOutlet weak var artistImagesCollectionView: UICollectionView!
    @IBOutlet weak var artistDetailViewMoreImagesButton: UIButton!
    
    private let artist = ArtistDetailBroker.init().artist
    let reuseIdentifier = "ArtistDetailImagesCell"
    var imageTapped: Bool = false
    var blurView: UIVisualEffectView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistDetailImageView.image = UIImage(named: artist!.artistImage!)
        self.artistDetailRatingLabel.text = artist!.rating!
        self.setDistanceLabel()
        self.navigationItem.title = artist!.artistName!
//        let scrollView = UIScrollView.init(frame: self.view.bounds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setDistanceLabel() {
        let artistLocation = CLLocation(latitude: (artist!.latitude! as NSString).doubleValue, longitude: (artist!.longitude! as NSString).doubleValue)
        if let location = locationBroker?.locationManager.location {
            let distanceInDouble = locationBroker!.getDistance(artistLocation, userLocation:  location)! / 1000
            self.artistDetailDistanceLabel.text = "\(round(distanceInDouble * 100) / 100) kms from you"
        } else {
            self.artistDetailDistanceLabel.text = "Current location not found for distance"
            self.artistDetailDistanceLabel.textColor = UIColor.purpleColor()
            self.artistDetailDistanceLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 5)
        }
    }
}


extension ArtistDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artist!.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ArtistDetailImageCollectionViewCell
        
        cell.artistDetialImagesImageView.image = UIImage(named: artist!.images[indexPath.row].rawString()!)
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 25
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if (!imageTapped) {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = UIScreen.mainScreen().bounds
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.imageTapped = true
//            var tap = UITapGestureRecognizer.init(target: blurEffectView, action: Selector("closeBlurViewScreen"))
//            tap.delegate = self
            self.blurView = blurEffectView
            self.view.addSubview(blurEffectView)
        }
    }
    
    func closeBlurViewScreen() {
        self.blurView?.removeFromSuperview()
        self.blurView = nil
    }
}
