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
        case idCard = "身份证"
        case passport = "护照"
    }
    
    
    
    let titleLabel: UILabel = {
        let t = UILabel()
        t.text = "我们需要您的个人信息以确保货物安全"
        return t
    }()
    
    let nameLabel: UILabel = {
        let t = UILabel()
        t.text = "姓名："
        return t
    }()
    let nameTextField : UITextField = {
        let t = UITextField()
        t.placeholder = "请输入您的姓名"
        return t
    }()
    let nameUnderLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    let idTypeLabel: UILabel = {
        let t = UILabel()
        t.text = "证件类型："
        return t
    }()
    lazy var idTypeButton: UIButton = {
        let b = UIButton()
        b.setTitle(IDType.idCard.rawValue, for: .normal)
        b.addTarget(self, action: #selector(idTypeMakeChange), for: .touchUpInside)
        return b
    }()
    let idTypeUnderLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.backgroundColor = .green
        return s
    }()
    
    let uploadIDLabel: UILabel = {
        let t = UILabel()
        t.text = "上传证件照片："
        return t
    }()
    
    let uploadProfileLabel: UILabel = {
        let t = UILabel()
        t.text = "上传真人大头照："
        return t
    }()
    
    
    
    lazy var submitButton : UIButton = {
        let b = UIButton()
        b.setTitle("完成验证", for: .normal)
        b.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        setupNavigationBar()
//        setupTitleLabel()
//        setupNameInputContents()
//        setupIDTypeSelectionContents()
//        setupScrollContainer()
        
    }
    
    
    func idTypeMakeChange(){
        print("change user id type!!!!!")
    }
    
    func submitButtonTapped(){
        print("submitButtonTapped!!!!!!")
    }
    
    
}


