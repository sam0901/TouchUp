//
//  HomeCategoryWidgetModel.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-18.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeCategoryWidgetModel {
    let id : String?
    let typeName : String?
    let imageName: String?
    let title : String?
    
    init(id: String?, typeName: String?, imageName: String?, title: String?) {
        self.id = id!
        self.typeName = typeName!
        self.imageName = imageName!
        self.title = title!
    }
}