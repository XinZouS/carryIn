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
    var phoneCountryCode: String?
    var email:    String?
    var imageUrl: String?
    
    var idCardA_Url: String?
    var idCardB_Url: String?
    var passportUrl: String?
    
    var itemList : [String]? // itemId better
    var tripList : [String]? // tripId
    
    var isShipper: Bool?
    
    
    // use: User.sharedInstance.xxx
    static var sharedInstance = User()  // This is singleton
    
    private override init() {
        super.init()
        id = ""
        username = ""
        password = ""
        nickName = ""
        phone = ""
        phoneCountryCode = "86"
        email = ""
        imageUrl = ""
        idCardA_Url = ""
        idCardB_Url = ""
        passportUrl = ""
        itemList = []
        tripList = []
        isShipper = false
    }
    
    func setupBy(dictionary: [String : Any]) {
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
        
        itemList = dictionary["itemList"] as? [String]
        tripList = dictionary["tripList"] as? [String]
        
        isShipper = dictionary["isShipper"] as? Bool ?? false
    }
    
    
}

