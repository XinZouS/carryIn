//
//  PhoneNumberController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


extension PhoneNumberController {
    
    // MARK: logic func
    
    func okButtonTapped(){
        print("TODO: okButtonTapped, api send text msg and go to next page!!!")
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: self.phoneNumber, zone: self.countryCode, result: { (err) in
            if err == nil {
                print("PhoneNumberController: 获取验证码成功")
            } else {
                print("PhoneNumberController: 有错误:\(err)")
            }

        })
    }
    
    func showUserAgreementPage(){
        print("TODO: showUserAgreementPage...!!!")
    }
    
    

    
    
}

