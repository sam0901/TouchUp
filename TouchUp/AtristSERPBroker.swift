//
//  AtristSERPBroker.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-21.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtistSERPBroker {
    
    //    let homePageURL = ""
    //    var rest: RestApiManager
    var json: JSON = []
    var artists : [ArtistSERPModel] = []
    
    init() {
        if let path = NSBundle.mainBundle().pathForResource("sampleArtistSERP", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                self.json = JSON(data: data)
                print(self.json)
                for artist in self.json["artists"] {
                    let artistId = artist.1["artistId"].rawString()
                    let artistName = artist.1["artistName"].rawString()
                    let artistShortBio = artist.1["artistShortBio"].rawString()
                    let artistImageName = artist.1["artistImageName"].rawString()
                    
                    self.artists.append(ArtistSERPModel(artistId: artistId!, artistName: artistName!, artistShortBio: artistShortBio!, artistImageName: artistImageName!))
                }
            }
        }
        //  self.rest = RestApiManager.init(baseURL : self.homePageURL)
    }
}
