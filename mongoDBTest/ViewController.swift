//
//  ViewController.swift
//  mongoDBTest
//
//  Created by Richard Urunuela on 09/07/2018.
//  Copyright © 2018 Richard Urunuela. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
/*
 https://www.raywenderlich.com/188427/alamofire-tutorial-getting-started-3
 */

class ViewController: UIViewController {
    var mykey = "TODEFINE"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //INIT
        if let path = Bundle.main.path(forResource: "information", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                debugPrint(dict["MYKEY"] as! String)
                self.mykey = dict["MYKEY"] as! String
                
            }
            else {
                 return()
            }
        }
       
        
        
        //GET database
        
       
        Alamofire.request("https://api.mlab.com/api/1/databases?apiKey=\(mykey)").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }
        
        //Get collection
        Alamofire.request("https://api.mlab.com/api/1/databases/cars/collections?apiKey=\(mykey)").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }
        
        //https://developerslogblog.wordpress.com/2017/03/09/swift-3-simple-rest-with-alamofire/
      
        //create Document
       let parameters = [
            "name": "user1",
            "email": "user1@org"
        ]
      /*  Alamofire.request("https://api.mlab.com/api/1/databases/cars/collections/student?apiKey=\(mykey)", method: .post, parameters: parameters as? [String: Any], encoding: JSONEncoding.default, headers: [:]).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }*/
         //DElete specific record
        //5b43c98e1f6e4f47e86bde7a
        Alamofire.request("https://api.mlab.com/api/1/databases/cars/collections/student/5b43c98e1f6e4f47e86bde7a?apiKey=\(mykey)", method: .delete, parameters: parameters as? [String: Any], encoding: JSONEncoding.default, headers: [:]).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }
        
       
        //get document
        
        Alamofire.request("https://api.mlab.com/api/1/databases/cars/collections/student?apiKey=\(mykey)").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

