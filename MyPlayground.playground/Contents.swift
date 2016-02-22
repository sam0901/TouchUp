//: Playground - noun: a place where people can play

import UIKit
import SwiftyJSON

let path = NSBundle.mainBundle().pathForResource("homepage", ofType: "json")

let data = NSData(contentsOfFile: path!)

let json = JSON(data: data!)

let widgets = json["widgets"]

for widget in widgets {
    print(widget.1["id"].type)
}
