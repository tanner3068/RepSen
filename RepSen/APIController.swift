//
//  APIController.swift
//  RepSen
//
//  Created by John Tanner on 10/12/15.
//  Copyright © 2015 John Tanner. All rights reserved.
//

import Foundation

class APIController: NSObject {
    
static func searchRepByState(state: String, completion: (reps: [Reps]) ->Void) {
        
        let URLStringRep = "http://whoismyrepresentative.com/getall_reps_bystate.php?state=\(state)&output=json"
        let urlRep = NSURL(string: URLStringRep)!

        
          let dataTaskForRep = NSURLSession.sharedSession().dataTaskWithURL(urlRep) { (data, respose, error) in
            if let data = data {
                do{
                    let mainResultsRep = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
                    print("Results for reps: \(mainResultsRep)")
                    
                    let representativeDictionaries = mainResultsRep["results"] as! [[String:String]]
                    
                    var arrayOfModelReps: [Reps] = []
                    
        //   for dictionary: Dictionary in representativeDictionaries {
                    for dictionary in representativeDictionaries {
                        
                        let rep = Reps(dictionaryOfRep: dictionary)
                        arrayOfModelReps.append(rep)
                    }
                    completion(reps: arrayOfModelReps)
                    
                }catch {
                    print("Error")
                    completion(reps: [])  // return reps empty
                }
            }else {
                completion(reps: []) // return reps empty
            }
        }
        dataTaskForRep.resume()
    }
    
}