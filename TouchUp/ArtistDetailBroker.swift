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
    var artists : [ArtistDetailModel] = []
    
    init() {
        if let path = NSBundle.mainBundle().pathForResource("sampleArtistDetail", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                self.json = JSON(data: data)
                for artist in self.json["artists"] {
                    let artistId = artist.1["artistId"].rawString()
                    let artistName = artist.1["artistName"].rawString()
                    let artistImage = artist.1["artistImage"].rawString()
                    let artistShortBio = artist.1["artistShortBio"].rawString()
                    let artistImageName = artist.1["artistImageName"].rawString()
                    let rating = artist.1["rating"].rawString()
                    let images = artist.1["images"].rawValue
                    let artistLongBio = artist.1["artistLongBio"].rawString()
                    let qualifications = artist.1["qualifications"].rawString()
                    let latitude = artist.1["location"]["latitude"].rawString()
                    let longitude = artist.1["location"]["longitude"].rawString()
                    
//                    self.artists.append(ArtistDetailModel(artistId: artistId!, artistName: artistName!, artistShortBio: artistShortBio!, artistImageName: artistImageName!, rating: rating!,images: images,artistLongBio: artistLongBio!, qualifications: qualifications!, latitude: latitude!, longitude: longitude!))
                }
            }
        }
        //  self.rest = RestApiManager.init(baseURL : self.artistsForCategoryURL)
    }
}
