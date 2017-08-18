//
//  UserInfoViewController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


extension UserInfoViewController {
    
    
    func dismissSelfToLeft(){
//        navigationController?.popToRootViewController(animated: true)
//        return
        
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)

    }
    
}

