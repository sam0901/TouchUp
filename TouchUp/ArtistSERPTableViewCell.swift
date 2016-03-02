//
//  ArtistSERPTableViewCell.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-21.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import UIKit

class ArtistSERPTableViewCell: UITableViewCell {

    @IBOutlet weak var artistSERPCellImageView: UIImageView!
    @IBOutlet weak var artistCellNameLabel: UILabel!
    @IBOutlet weak var artistCellShortBioLabel: UILabel!
    @IBOutlet weak var artistCellDistanceLabel: UILabel!
    @IBOutlet weak var artistRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selected = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
