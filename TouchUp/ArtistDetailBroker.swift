//
//  ArtistDetailBroker.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-28.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtistDetailBroker {
    
    //    let artistsForCategoryURL = ""
    //    var rest: RestApiManager
    var json: JSON = []
    var artist: ArtistDetailModel? = nil
    
    init() {
        if let path = NSBundle.mainBundle().pathForResource("sampleArtistDetail", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                self.json = JSON(data: data)
                let artist = self.json
                let artistId = artist["artistId"].rawString()
                let artistName = artist["artistName"].rawString()
                let artistImage = artist["artistImage"].rawString()
                let artistShortBio = artist["artistShortBio"].rawString()
                let rating = artist["rating"].rawString()
                let images = artist["images"]
                let artistLongBio = artist["artistLongBio"].rawString()
                let qualifications = artist["qualifications"]
                let latitude = artist["location"]["latitude"].rawString()
                let longitude = artist["location"]["longitude"].rawString()
                    
                self.artist = ArtistDetailModel.init(artistId: artistId!, artistName: artistName!, artistImage: artistImage!, artistShortBio: artistShortBio!, rating: rating!, images: images, artistLongBio: artistLongBio!, qualifications: qualifications, latitude: latitude!, longitude: longitude!)
                
            }
        }
        //  self.rest = RestApiManager.init(baseURL : self.artistsForCategoryURL)
    }
}
