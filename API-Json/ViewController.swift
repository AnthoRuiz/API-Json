//
//  ViewController.swift
//  API-Json
//
//  Created by Anthony Ruiz on 3/23/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      let url = URL(string: "http://api.fixer.io/latest")
      let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
         if error != nil{
            print("ERROR")
         }else{
            if let content = data {
               do{
                  //Array
                  let myJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                  if let rates = myJSON["rates"] as? NSDictionary{
                     if let currency = rates["USD"]{
                        print(currency)
                     }
                  }
               }
               catch{
                  
               }
            }
         }
      }
      task.resume()
      
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

