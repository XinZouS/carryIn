//
//  ItemCategory.swift
//  carryonex
//
//  Created by Xin Zou on 8/19/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class ItemCategory: NSObject {
    
    var nameCN : String?
    var nameEN : String?
    var icon   : UIImage?
    
    var count : Int = 0
    
    
    override init() {
        super.init()
        nameCN = "类别？"
        nameEN = "category?"
        icon = #imageLiteral(resourceName: "CarryonEx_Logo")
        count = 0
    }
    
    init(nameCn: String, nameEn: String, iconImg: UIImage){
        nameCN = nameCn
        nameEN = nameEn
        icon = iconImg
        count = 0
    }
    
}



