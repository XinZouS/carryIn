//
//  DisclaimerController.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class DisclaimerController: UIViewController {
    
    let titleLabel : UILabel = {
        let b = UILabel()
        b.text = "用户协议"
        b.font = UIFont.boldSystemFont(ofSize: 23)
        b.textAlignment = .center
        return b
    }()
    
    let contentTextView: UITextView = {
        let v = UITextView()
        v.font = UIFont.systemFont(ofSize: 14)
        v.isEditable = false
        return v
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .yellow
        v.isScrollEnabled = true
        return v
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupContent()
        
    }
    
    private func setupTitle(){
        view.addSubview(titleLabel)
        titleLabel.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: view.rightAnchor, bottom: nil, leftConstent: 0, topConstent: 20, rightConstent: 0, bottomConstent: 0, width: 0, height: 30)
    }
    
    private func setupContent(){
        
    }
    
}
