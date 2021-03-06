//
//  ArtistSERPModel.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-21.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtistSERPModel {
    let artistId : String?
    let artistName : String?
    let artistShortBio : String?
    let artistImageName : String?
    
    init(artistId: String?, artistName: String?, artistShortBio: String?, artistImageName: String?) {
        self.artistId = artistId
        self.artistName = artistName
        self.artistShortBio = artistShortBio
        self.artistImageName = artistImageName
    }
}
