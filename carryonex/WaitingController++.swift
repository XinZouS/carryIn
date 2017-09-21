//
//  WaitingController++.swift
//  carryonex
//
//  Created by Xin Zou on 9/21/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit

extension WaitingController {
    
    
    internal func dismissView(){
        UIApplication.shared.statusBarStyle = .lightContent
        
        print("dismissView!!!!")
        dismiss(animated: true, completion: nil)
    }
    
    
    func shareToWechat(){
        let title: String = "CarryonEx 帮你把思念带回家"
        let msg: String = "关注我们的网站获取更多活动信息：https://www.carryonex.com/"
        print(title, msg)
    }
    
    func shareToMonent(){
        let title: String = "CarryonEx 帮你把思念带回家"
        let msg: String = "关注我们的网站获取更多活动信息：https://www.carryonex.com/"
        print(title, msg)
    }
    
    func shareToWeibo(){
        let title: String = "CarryonEx 帮你把思念带回家"
        let msg: String = "关注我们的网站获取更多活动信息：https://www.carryonex.com/"
        print(title, msg)
    }
    
    func shareToFacebook(){
        let title: String = "CarryonEx 帮你把思念带回家"
        let msg: String = "关注我们的网站获取更多活动信息：https://www.carryonex.com/"
        print(title, msg)
        
    }
    
}

// MARK: - Pop alert view
extension WaitingController {
    
    func displayAlert(title: String, message: String, action: String) {
        let v = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: action, style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        v.addAction(action)
        present(v, animated: true, completion: nil)
    }
    
}

