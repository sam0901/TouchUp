//
//  RestApiManager.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-14.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager : NSObject {
    typealias ServicesResponse = (JSON, NSError?) -> Void
    
    let baseURl = ""
    
    func getRequest(params : NSDictionary)  {
        
        let headers = [
            "Authorization" : "",
            "Content-Type"  : ""
        ]
        
        Alamofire.request(.GET, baseURl, headers : headers, parameters: params as? [String : AnyObject]).response { request, response, data, error in
            // return the data in JSON
        }
    }
    
    func postRequest(params: NSDictionary?) {
        
        // can do headers here 
        let headers = [
            "Authorization" : "",
            "Content-Type"  : ""
        ]
        
        Alamofire.request(.POST, baseURl, headers : headers, parameters : params as? [String : AnyObject], encoding: .JSON).response { request, response, data, error in
            // return the data in JSON
        }
    }
    
    func uploadImage(fileURL: NSURL?) {
        Alamofire.upload(.POST, baseURl, file: fileURL!).progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
            print(totalBytesWritten)
            
            dispatch_async(dispatch_get_main_queue()) {
                print("Total Bytes written on main queue: \(totalBytesWritten)")
            }
        }.responseJSON { response in
                debugPrint(response)
        }
    }
    
    func downloadImage(imageURL : NSURL?) {
        // Stub for download function
    }
}


















































//    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//
//        let session = NSURLSession.sharedSession()
//
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            let json:JSON = JSON(data: data!)
//            onCompletion(json, error)
//        })
//        task.resume()
//    }
//
//    func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//
//        // Set the method to POST
//        request.HTTPMethod = "POST"
//
//        // Set the POST body for the request
//        do {
//            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
//        } catch let error {
//            print(error)
//            return
//        }
//        let session = NSURLSession.sharedSession()
//
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            let json:JSON = JSON(data: data!)
//            onCompletion(json, error)
//        })
//        task.resume()
//    }
//}

//class RestApiManager: NSObject {
//
//
//    func post(params : Dictionary<String, String>, url : String) {
//        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
//        let session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//
//        do {
//            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
//        } catch let error {
//            print(error)
//            return
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            guard error == nil else { return }
//
//            print("Response: \(response)")
//            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("Body: \(strData)")
//
//            let json: NSDictionary?
//            do {
//                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
//            } catch let dataError {
//                print(dataError)
//                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print("Error could not parse JSON: '\(jsonStr)'")
//                return
//            }
//
//            if let parseJSON = json {
//                let success = parseJSON["success"] as? Int
//                print("Succes: \(success)")
//            }
//            else {
//                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print("Error could not parse JSON: \(jsonStr)")
//            }
//        })
//
//        task.resume()
//    }
//
//
//    func get(url: String, parameters: [String: AnyObject], completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionTask {
//        let parameterString = parameters.stringFromHttpParameters()
//        let requestURL = NSURL(string:"\(url)?\(parameterString)")!
//
//        let request = NSMutableURLRequest(URL: requestURL)
//        request.HTTPMethod = "GET"
//
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request, completionHandler:completionHandler)
//        task.resume()
//
//        return task
//    }
//}