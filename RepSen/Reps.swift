//
//  Reps.swift
//  RepSen
//
//  Created by John Tanner on 10/12/15.
//  Copyright © 2015 John Tanner. All rights reserved.
//

import Foundation

class Reps: NSObject {
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    
    init (dictionaryOfRep: [String: String]) {
        
        
        self.name = dictionaryOfRep["name"]
        self.party = dictionaryOfRep["party"]
        self.state = dictionaryOfRep["state"]
        self.district = dictionaryOfRep["district"]
        self.phone = dictionaryOfRep["phone"]
        self.office = dictionaryOfRep["office"]
        self.link = dictionaryOfRep["link"]
    
}
}