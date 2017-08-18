//
//  PhotoIDController.swift
//  carryonex
//
//  Created by Xin Zou on 8/15/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class PhotoIDController: UIViewController {
    
    enum IDType: String {
        case idCard = "身份证 🔽"
        case passport = "护照 🔽"
    }
    
    enum ImageForIDsType {
        case passport, idCardA, idCardB, profile
    }
    
    var idType: IDType = .passport
    
    var idCardA_Img : UIImage?
    var idCardB_Img : UIImage?
    var passportImg : UIImage?
    var profileImg  : UIImage?
    var imagePickedType: ImageForIDsType?
    
    let pageMargin: CGFloat = 20
    let imgMargin : CGFloat = 30
    let labelH : CGFloat = 50
    /// imgH: screen.Width - 2 * (imgMargin + pageMargin) * screenRatio(9/16)
    let imgH : CGFloat = (UIScreen.main.bounds.width - 2 * (30 + 20)) * (9.0 / 14.0)
    
    let titleLabel: UILabel = {
        let t = UILabel()
        t.textAlignment = .center
        t.text = "我们需要您的个人信息以确保货物安全"
        t.font = UIFont.boldSystemFont(ofSize: 18)
        return t
    }()
    
    let scrollContainer : UIScrollView = {
        let v = UIScrollView()
        //v.backgroundColor = .yellow
        v.isDirectionalLockEnabled = true
        return v
    }()
    
    let nameLabel: UILabel = {
        let t = UILabel()
        //t.backgroundColor = .orange
        t.textAlignment = .left
        t.text = "姓名："
        return t
    }()
    lazy var nameTextField : UITextField = {
        let t = UITextField()
        //t.backgroundColor = .green
        t.textAlignment = .right
        t.placeholder = "请输入您的姓名"
        t.returnKeyType = .done
        t.delegate = self
        return t
    }()
    let nameUnderLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    let idTypeLabel: UILabel = {
        let t = UILabel()
        //t.backgroundColor = .orange
        t.textAlignment = .left
        t.text = "证件类型："
        return t
    }()
    let idTypeBtnTitleAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                                    NSForegroundColorAttributeName: UIColor.black]
    lazy var idTypeButton: UIButton = {
        let b = UIButton()
        //b.backgroundColor = buttonColorBlue
        //b.setTitle(IDType.passport.rawValue, for: .normal)
        let att = [NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                   NSForegroundColorAttributeName: UIColor.black]
        let attributeStr = NSAttributedString(string: IDType.passport.rawValue, attributes: att)
        b.setAttributedTitle(attributeStr, for: .normal)
        b.contentHorizontalAlignment = .right // button title to the right
        b.addTarget(self, action: #selector(idTypeMakeChange), for: .touchUpInside)
        return b
    }()
    let idTypeSelectionView: UIView = {
        let v = UIView()
        //v.backgroundColor = .orange
        return v
    }()
    let idTypeUnderLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    var passportLabelHeighConstraint : NSLayoutConstraint?
    
    let passportUploadLabel: UILabel = {
        let t = UILabel()
        //t.backgroundColor = .green
        t.textAlignment = .left
        t.text = "上传护照个人信息页照片："
        return t
    }()
    
    var passportButtonHeighConstraint: NSLayoutConstraint?
    
    lazy var passportButton : UIButton = {
        let b = UIButton()
        //b.backgroundColor = .green
        b.setBackgroundImage(#imageLiteral(resourceName: "uploadID"), for: .normal)
        b.addTarget(self, action: #selector(passportButtonTapped), for: .touchUpInside)
        return b
    }()
    
    var idCardALabelHeightConstraint: NSLayoutConstraint?
    var idCardBLabelHeightConstraint: NSLayoutConstraint?
    var idCardAButtonHeightConstraint: NSLayoutConstraint?
    var idCardBButtonHeightConstraint: NSLayoutConstraint?

    let idCardAUploadLabel: UILabel = {
        let t = UILabel()
        //t.backgroundColor = .green
        t.textAlignment = .left
        t.text = "上传身份证正面照片："
        return t
    }()
    
    lazy var idCardA_Button : UIButton = {
        let b = UIButton()
        //b.backgroundColor = .green
        b.setBackgroundImage(#imageLiteral(resourceName: "uploadID"), for: .normal)
        b.addTarget(self, action: #selector(idCardA_ButtonTapped), for: .touchUpInside)
        return b
    }()
    
    let idCardBUploadLabel: UILabel = {
        let t = UILabel()
        //t.backgroundColor = .green
        t.textAlignment = .left
        t.text = "上传身份证背面照片："
        return t
    }()
    
    lazy var idCardB_Button : UIButton = {
        let b = UIButton()
        //b.backgroundColor = .green
        b.setBackgroundImage(#imageLiteral(resourceName: "uploadID"), for: .normal)
        b.addTarget(self, action: #selector(idCardB_ButtonTapped), for: .touchUpInside)
        return b
    }()
    
    let profileUploadLabel: UILabel = {
        let t = UILabel()
        t.text = "上传真人大头照："
        t.textAlignment = .left
        return t
    }()
    
    lazy var profileButton : UIButton = {
        let b = UIButton()
        //b.backgroundColor = .green
        b.setBackgroundImage(#imageLiteral(resourceName: "uploadID"), for: .normal)
        b.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return b
    }()
    
    
    lazy var submitButton : UIButton = {
        let b = UIButton()
        b.backgroundColor = buttonColorBlue
        //b.setTitle("完成验证", for: .normal)
        let att = [NSFontAttributeName: UIFont.systemFont(ofSize: 18),
                   NSForegroundColorAttributeName: UIColor.black]
        let str = NSAttributedString(string: "完成验证", attributes: att)
        b.setAttributedTitle(str, for: .normal)
        b.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return b
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupTitleLabel()
        setupScrollViewContainer() // this container MUST setup before other contents!!!
    }
    
    private func setupNavigationBar(){
        UINavigationBar.appearance().tintColor = buttonColorWhite
        navigationController?.navigationBar.tintColor = buttonColorWhite
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: buttonColorWhite]        
    }
    private func setupTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.addConstraints(left: view.leftAnchor, top: topLayoutGuide.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: 0, topConstent: 10, rightConstent: 0, bottomConstent: 0, width: 0, height: 26)
    }
    private func setupScrollViewContainer(){ // this container MUST setup before other contents!!!
        //scrollContainer.contentSize = CGSize(width: UIScreen.main.bounds.width - 220.0, height: 1000)
        view.addSubview(scrollContainer)
        scrollContainer.addConstraints(left: view.leftAnchor, top: titleLabel.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, leftConstent: 0, topConstent: 10, rightConstent: 0, bottomConstent: 0, width: 0, height: 0)
        scrollContainer.keyboardDismissMode = .interactive // allow user to drag down keyboard
        
        // following setup orders NOT allow to change, post items depend on pre items;
        setupNameInputContents()
        setupIdTypeSelectionContents()
        
        setupPassportContents()
        setupIdCardContents()
        setupProfileContents()
        
        setupSubmitButton()
    }
    
    private func setupNameInputContents(){
        
        scrollContainer.addSubview(nameLabel)
        nameLabel.addConstraints(left: view.leftAnchor, top: scrollContainer.topAnchor, right: nil, bottom: nil, leftConstent: pageMargin, topConstent: 10, rightConstent: 0, bottomConstent: 0, width: 90, height: labelH)
        
        scrollContainer.addSubview(nameTextField)
        nameTextField.addConstraints(left: nameLabel.rightAnchor, top: nameLabel.topAnchor, right: view.rightAnchor, bottom: nameLabel.bottomAnchor, leftConstent: 10, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 0)
        nameTextField.becomeFirstResponder()
        
        scrollContainer.addSubview(nameUnderLineView)
        nameUnderLineView.addConstraints(left: view.leftAnchor, top: nameLabel.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: pageMargin, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 1)
        
    }
    
    private func setupIdTypeSelectionContents(){
        
        scrollContainer.addSubview(idTypeLabel)
        idTypeLabel.addConstraints(left: view.leftAnchor, top: nameUnderLineView.bottomAnchor, right: nil, bottom: nil, leftConstent: pageMargin, topConstent: 20, rightConstent: 0, bottomConstent: 0, width: 90, height: labelH)
        
        scrollContainer.addSubview(idTypeButton)
        idTypeButton.addConstraints(left: idTypeLabel.rightAnchor, top: idTypeLabel.topAnchor, right: view.rightAnchor, bottom: idTypeLabel.bottomAnchor, leftConstent: 10, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 0)
        
        scrollContainer.addSubview(idTypeUnderLineView)
        idTypeUnderLineView.addConstraints(left: view.leftAnchor, top: idTypeLabel.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: pageMargin, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 1)
        
    }
    
    // for image buttons of Passport and idCard ----------------------------
    
    private func setupPassportContents(){
        
        scrollContainer.addSubview(passportUploadLabel)
        passportUploadLabel.addConstraints(left: view.leftAnchor, top: idTypeUnderLineView.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: pageMargin, topConstent: 10, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 0)
        passportLabelHeighConstraint = passportUploadLabel.heightAnchor.constraint(equalToConstant: labelH)
        passportLabelHeighConstraint?.isActive = true

        scrollContainer.addSubview(passportButton)
        passportButton.addConstraints(left: view.leftAnchor, top: passportUploadLabel.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: pageMargin + imgMargin, topConstent: 0, rightConstent: pageMargin + imgMargin, bottomConstent: 0, width: 0, height: 0)
        passportButtonHeighConstraint = passportButton.heightAnchor.constraint(equalToConstant: imgH)
        passportButtonHeighConstraint?.isActive = true
        
    }
    
    private func setupIdCardContents(){
        
        let sL = view.leftAnchor // scrollContainer.leftAnchor
        let sR = view.rightAnchor // scrollContainer.rightAnchor
        
        scrollContainer.addSubview(idCardAUploadLabel)
        idCardAUploadLabel.addConstraints(left: sL, top: passportButton.bottomAnchor, right: sR, bottom: nil, leftConstent: pageMargin, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 0)
        idCardALabelHeightConstraint = idCardAUploadLabel.heightAnchor.constraint(equalToConstant: 0) // labelH
        idCardALabelHeightConstraint?.isActive = true
        
        scrollContainer.addSubview(idCardA_Button)
        idCardA_Button.addConstraints(left: sL, top: idCardAUploadLabel.bottomAnchor, right: sR, bottom: nil, leftConstent: pageMargin + imgMargin, topConstent: 0, rightConstent: pageMargin + imgMargin, bottomConstent: 0, width: 0, height: 0)
        idCardAButtonHeightConstraint = idCardA_Button.heightAnchor.constraint(equalToConstant: 0) // imgH
        idCardAButtonHeightConstraint?.isActive = true
        //--------------
        scrollContainer.addSubview(idCardBUploadLabel)
        idCardBUploadLabel.addConstraints(left: sL, top: idCardA_Button.bottomAnchor, right: sR, bottom: nil, leftConstent: pageMargin, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: 0)
        idCardBLabelHeightConstraint = idCardBUploadLabel.heightAnchor.constraint(equalToConstant: 0) // labelH
        idCardBLabelHeightConstraint?.isActive = true
        
        scrollContainer.addSubview(idCardB_Button)
        idCardB_Button.addConstraints(left: sL, top: idCardBUploadLabel.bottomAnchor, right: sR, bottom: nil, leftConstent: pageMargin + imgMargin, topConstent: 0, rightConstent: pageMargin + imgMargin, bottomConstent: 0, width: 0, height: 0)
        idCardBButtonHeightConstraint = idCardB_Button.heightAnchor.constraint(equalToConstant: 0) // imgH
        idCardBButtonHeightConstraint?.isActive = true
        
    }
    
    private func setupProfileContents(){
        scrollContainer.addSubview(profileUploadLabel)
        profileUploadLabel.addConstraints(left: view.leftAnchor, top: idCardB_Button.bottomAnchor, right: view.rightAnchor, bottom: nil, leftConstent: pageMargin, topConstent: 0, rightConstent: pageMargin, bottomConstent: 0, width: 0, height: labelH)
        
        let imgHW : CGFloat = UIScreen.main.bounds.width - 2 * (imgMargin + pageMargin + 30)
        
        scrollContainer.addSubview(profileButton)
        profileButton.addConstraints(left: nil, top: profileUploadLabel.bottomAnchor, right: nil, bottom: nil, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: imgHW, height: imgHW)
        profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupSubmitButton(){
        scrollContainer.addSubview(submitButton)
        submitButton.addConstraints(left: view.leftAnchor, top: profileButton.bottomAnchor, right: view.rightAnchor, bottom: scrollContainer.bottomAnchor, leftConstent: 0, topConstent: 30, rightConstent: 0, bottomConstent: 0, width: 0, height: 40)
        //submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    func idTypeMakeChange(){
        
        print("change user id type!! current type is \(idType)!!!")
        
        switch idType { // current idType in cases:
            
        case .passport:
            idType = IDType.idCard // change to idCard
            passportLabelHeighConstraint?.constant = 0
            passportButtonHeighConstraint?.constant = 0
            
            idCardALabelHeightConstraint?.constant = labelH
            idCardAButtonHeightConstraint?.constant = imgH
            idCardBLabelHeightConstraint?.constant = labelH
            idCardBButtonHeightConstraint?.constant = imgH
            
        case .idCard:
            idType = IDType.passport
            passportLabelHeighConstraint?.constant = labelH
            passportButtonHeighConstraint?.constant = imgH
            
            idCardALabelHeightConstraint?.constant = 0
            idCardAButtonHeightConstraint?.constant = 0
            idCardBLabelHeightConstraint?.constant = 0
            idCardBButtonHeightConstraint?.constant = 0
            
        default:
            print("Error: PhotoIDController: ")
        }
        
        // change button title by attributed string:
        let attStr = NSAttributedString(string: idType.rawValue, attributes: idTypeBtnTitleAttributes)
        idTypeButton.setAttributedTitle(attStr, for: .normal)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func submitButtonTapped(){
        print("submitButtonTapped!!!!!!")
    }
    
    
}


