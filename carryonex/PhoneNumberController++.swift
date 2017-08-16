//
//  PhoneNumberController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


protocol PhoneNumberDelegate : class {
    func dismissAndReturnToHomePage()
}


extension PhoneNumberController: UITextFieldDelegate, PhoneNumberDelegate {
    
    // MARK: logic func
    
    func okButtonTapped(){
        okButtonDisable()
        _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(okButtonEnable), userInfo: nil, repeats: false)
        
        let phoneNum = User.sharedInstance.phone ?? "0"
        let zoneCode = User.sharedInstance.phoneCountryCode ?? "86"
        print("get : okButtonTapped, api send text msg and go to next page!!!")
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: phoneNum, zone: zoneCode, result: { (err) in
            if err == nil {
                print("PhoneNumberController: 获取验证码成功, go next page!!!")
                self.goToVerificationPage()
            } else {
                print("PhoneNumberController: 有错误: \(err)")
                let msg = "未能发送验证码，请确认手机号与地区码输入正确，换个姿势稍后重试。错误信息：\(err)"
                self .showAlertWith(title: "获取验证码失败", message: msg)
            }
        })
    }
    private func okButtonDisable(){
        okButton.setTitle("正在请求验证码...", for: .normal)
        okButton.backgroundColor = .lightGray
        okButton.isEnabled = false
    }
    @objc private func okButtonEnable(){
        okButton.setTitle("获取验证码", for: .normal)
        okButton.backgroundColor = buttonColorBlue
        okButton.isEnabled = true
    }
    private func showAlertWith(title:String, message:String){
        let alertCtl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertCtl.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alertCtl.dismiss(animated: true, completion: nil)
        }))
        self.present(alertCtl, animated: true, completion: nil)
    }
    

    
    func showUserAgreementPage(){
        let disCtrlView = DisclaimerController()
        self.navigationController?.pushViewController(disCtrlView, animated: true)
    }
    
    // development use: go next page without phone verification
    func goToVerificationPage(){
        let verifiCtl = VerificationController()
        self.navigationController?.pushViewController(verifiCtl, animated: true)
    }

    
    
    // MARK: textField and keyboard
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneNumberTextField.becomeFirstResponder()
        flagPicker.isHidden = true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        phoneNumberTextField.resignFirstResponder()
        updatePhoneNum()
        updateOkButton()
    }
    
    func textFieldDidChange(_ textField: UITextField){
        updatePhoneNum()
        updateOkButton()
    }
    
    func agreeCheckboxChanged(){
        updateOkButton()
    }
    
    private func updatePhoneNum(){
        let phoneNumber = phoneNumberTextField.text ?? "0"
        User.sharedInstance.phone = phoneNumber
    }
    
    private func updateOkButton(){
        guard let num = phoneNumberTextField.text else { return }
        isPhoneNumValid = (num.characters.count >= 6)
        isUserAgree = agreeCheckbox.checkState == .checked
        
        okButton.isEnabled = isUserAgree && isPhoneNumValid
        okButton.backgroundColor = okButton.isEnabled ? buttonColorBlue : .lightGray
    }
    
    func setupKeyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    func keyboardDidShow(){
        flagPicker.isHidden = true
    }
    func keyboardDidHide(){
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        let locOnView = touch.location(in: view)
        if locOnView.y < (view.bounds.height / 2) { // touch outside keyboard
            phoneNumberTextField.resignFirstResponder()
        }
    }
    
    
    
    // MARK: pickerView delegate
    
    func openFlagPicker(){
        flagPicker.isHidden = !flagPicker.isHidden
        // will hide when begin to set phoneNum
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flagsTitle.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flagsTitle[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        User.sharedInstance.phoneCountryCode = codeOfFlag[flagsTitle[row]]!
        flagButton.setTitle(flagsTitle[row], for: .normal)
        print("pick countryCode: " , User.sharedInstance.phoneCountryCode)
    }
    
    
    // MARK: delegate: go back to home page
    
    func dismissAndReturnToHomePage(){
        self.navigationController?.popToRootViewController(animated: false)
        self.dismiss(animated: true) {
            print("go back to home page.")
        }
    }
    

    
}

