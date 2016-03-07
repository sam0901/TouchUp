//: Playground - noun: a place where people can play

import UIKit
import SwiftyJSON

let path = NSBundle.mainBundle().pathForResource("homepage", ofType: "json")

let data = NSData(contentsOfFile: path!)

let x = ["hello", "Hello"]
