//
//  UserInfoViewCell.swift
//  carryonex
//
//  Created by Xin Zou on 8/10/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class UserInfoViewCell: UICollectionViewCell {
    
    let titleLabel : UILabel = {
        let l = UILabel()
        l.backgroundColor = .green
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



