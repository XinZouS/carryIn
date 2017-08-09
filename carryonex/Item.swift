//
//  Cargo.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import Foundation


enum ItemCategory : String {
    case bagsOrShoes = "Bags Or Shoes"
    case healthCareProducts = "Health Care Products"
    case electronics = "Electronics"
}


class Item : NSObject {
    
    var id: String?
    var name: String?
    
    var length: Int?
    var width: Int?
    var heigh: Int?
    
    var weight: Int?
    var value: Int?
    
    var owner: User?
    var startShippingTimeStamp: NSNumber?
    var endShippingTimeStamp: NSNumber?
    
    var tripId: String?
    var itemCategory: ItemCategory?
    
    
    override init() {
        id = ""
        name = ""
        length = 0
        width = 0
        heigh = 0
        weight = 0
        value = 0
        owner = nil
        startShippingTimeStamp = 0
        tripId = ""
        itemCategory = nil
    }
    
    
    init(dictionary: [String:Any]){
        super.init()
        
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        length = dictionary["length"] as? Int
        width = dictionary["width"] as? Int
        heigh = dictionary["heigh"] as? Int
        weight = dictionary["weight"] as? Int
        value = dictionary["value"] as? Int
        
        owner = dictionary["owner"] as? User
        startShippingTimeStamp = dictionary["startShippingTimeStamp"] as? NSNumber
        endShippingTimeStamp = dictionary["endShippingTimeStamp"] as? NSNumber
        tripId = dictionary["tripId"] as? String
        itemCategory = dictionary["itemCategory"] as? ItemCategory
    }
    
}


