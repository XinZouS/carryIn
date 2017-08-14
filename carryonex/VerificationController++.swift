//
//  VerificationViewController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


extension VerificationController: UITextFieldDelegate {
    
    
    
    func resendButtonTapped(){
        print("should resend verification...")
        
    }
    
    func resetResendButtonTo60s(){
        resetTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown1sec), userInfo: nil, repeats: true)
    }
    func countDown1sec(){
        resendButton.backgroundColor = resetTime == 0 ? buttonColorBlue : UIColor.lightGray
        resendButton.isEnabled = (resetTime == 0)
        if resetTime == 0 {
            resetTimer?.invalidate()
            resetTime = 60
        }else{
            resetTime -= 1
            resendButton.setTitle("\(resetTime)秒后重新发送", for: .normal)
        }
    }
    
    
    func textFieldDidChange(_ textField: UITextField){
        verificationCode = textField.text ?? ""
        let cnt = verificationCode.characters.count
        if cnt == 0 {
            verifiCodeLabel1?.text = ""
        }else
        if cnt == 1 {
            verifiCodeLabel1?.text = String(describing: verificationCode.characters.last!)
            verifiCodeLabel2?.text = ""
            verifiCodeLabel3?.text = ""
            verifiCodeLabel4?.text = ""
        }else
        if cnt == 2 {
            verifiCodeLabel2?.text = String(describing: verificationCode.characters.last!)
            verifiCodeLabel3?.text = ""
            verifiCodeLabel4?.text = ""
        }else
        if cnt == 3 {
            verifiCodeLabel3?.text = String(describing: verificationCode.characters.last!)
            verifiCodeLabel4?.text = ""
        }else
        if cnt == 4 {
            verifiCodeLabel4?.text = String(describing: verificationCode.characters.last!)
            commitVerificationCode()
        }
        
    }
    
    private func commitVerificationCode(){
        let zoneCode = String(describing: User.sharedInstance.phoneCountryCode!)
        let phoneNum = String(describing: User.sharedInstance.phone!)
        print("get 4 code: will commitVerificationCode: \(verificationCode), and my phone: \(phoneNum), zoneCode: \(zoneCode)")
        
        guard zoneCode != "", phoneNum != "", zoneCode != "0", phoneNum != "0" else { return }
        
        resetResendButtonTo60s()

        SMSSDK.commitVerificationCode(verificationCode, phoneNumber: phoneNum, zone: zoneCode, result: { (err) in
            if err == nil {
                print("验证成功")
                self.phoneNumberController?.dismissAndBackToHomePage()
            } else {
                print("验证失败, TODO: use AlertView to show error: \(err!)")
            }
            
        })
    }
    
}

