//
//  artistDetailModel.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-28.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtistDetailModel {
    let artistId : String?
    let artistName : String?
    let artistImage : String?
    let artistShortBio : String?
    let rating: String?
    let images : JSON
    let artistLongBio : String?
    let qualifications : JSON
    let latitude : String?
    let longitude : String?
    
    
    init(artistId: String?, artistName : String?, artistImage : String?, artistShortBio : String?, rating : String?, images : JSON, artistLongBio : String?, qualifications : JSON, latitude : String?, longitude : String?) {
        self.artistId = artistId
        self.artistName = artistName
        self.artistImage = artistImage
        self.artistShortBio = artistShortBio
        self.rating = rating
        self.images = images
        self.artistLongBio = artistLongBio
        self.qualifications = qualifications
        self.longitude = longitude
        self.latitude = latitude
    }
}