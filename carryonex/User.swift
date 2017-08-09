//
//  User.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import Foundation


class User : NSObject {
    
    var id: String?
    var username: String?
    var password: String?
    
    var nickName: String?
    var phone:    String?
    var email:    String?
    var imageUrl: String?
    
    var idCardA_Url: String?
    var idCardB_Url: String?
    var passportUrl: String?
    
    var itemList : [Item]? // or use itemId is better???
    var tripList : [Trip]? // tripId ???
    
    var isShipper: Bool?
    
    
    
    init(dictionary: [String : Any]) {
        id = dictionary["id"] as? String
        username = dictionary["username"] as? String ?? ""
        password = dictionary["password"] as? String
        
        nickName = dictionary["nickName"] as? String
        phone = dictionary["phone"] as? String
        email = dictionary["email"] as? String
        imageUrl = dictionary["imageUrl"] as? String
        
        idCardA_Url = dictionary["idCardA_Url"] as? String
        idCardB_Url = dictionary["idCardB_Url"] as? String
        passportUrl = dictionary["passportUrl"] as? String
        
        itemList = dictionary["itemList"] as? [Item]
        tripList = dictionary["tripList"] as? [Trip]
        
        isShipper = dictionary["isShipper"] as? Bool ?? false
    }
    
    
}

