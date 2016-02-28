//
//  TUAppDelegate.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-28.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import Crashlytics
import PubNub

let themeColor = UIColor(red: 0.01, green: 0.0, blue: 0.80, alpha: 0.10)
let themeColorWithAlpha = UIColor(red: 0.01, green: 0.0, blue: 0.80, alpha: 0.80)
var locationBroker: LocationManager?
var loginFlag: Bool?

@UIApplicationMain
class TUAppDelegate: AppDelegate {
    
    override func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        self.initServices()
        Fabric.with([PubNub.self, Crashlytics.self])
//        loginFlag = true
        if (loginFlag != nil) {
            let mainStroyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController : UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier("rootNavigationController") as! UINavigationController
            window?.rootViewController = initialViewController
            return true
        }
        return true
    }
    
    private func initServices() {
        locationBroker = LocationManager.init()
    }
}