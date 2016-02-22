//
//  homePageBroker.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-15.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomePageBroker {
    
//    let homePageURL = ""
//    var rest: RestApiManager
    var json: JSON = []
    var widgets : [HomeCategoryWidgetModel] = []
    
    init() {
        if let path = NSBundle.mainBundle().pathForResource("homepage", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                self.json = JSON(data: data)
//                print(self.json)
                for widget in self.json["widgets"] {
                    let widgetId = widget.1["id"].rawString()
                    let widgetType = widget.1["type"].rawString()
                    let widgetImageName = widget.1["image"].rawString()
                    let widgetTitle = widget.1["title"].rawString()
                    self.widgets.append(HomeCategoryWidgetModel.init(id: widgetId, typeName: widgetType, imageName: widgetImageName, title: widgetTitle))
                }
            }
        }
//  self.rest = RestApiManager.init(baseURL : self.homePageURL)
    }
}
