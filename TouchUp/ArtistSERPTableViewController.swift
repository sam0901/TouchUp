//
//  ArtistSERPTableViewController.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-21.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit
import MapKit

class ArtistSERPTableViewController: UITableViewController {
    
    private let reuseIdentifier = "ArtistSERPCell"
    private let artists = ArtistSERPBroker.init().artists

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ArtistSERPTableViewCell
        
        cell.artistSERPCellImageView.image = UIImage(named: "image2.jpg")
        cell.artistCellNameLabel.text = artists[indexPath.row].artistName
        cell.artistCellShortBioLabel.text = artists[indexPath.row].artistShortBio
        let artistLocation = CLLocation(latitude: (artists[indexPath.row].latitude! as NSString).doubleValue, longitude: (artists[indexPath.row].longitude! as NSString).doubleValue)
        let currentLocation = locationBroker!.locationManager.location!
        let distanceInDouble = locationBroker!.getDistance(artistLocation, userLocation:  currentLocation)! / 1000
        cell.artistCellDistanceLabel.text = "\(round(distanceInDouble * 100) / 100) kms from you"
        
        return cell
    }

}
