//
//  UserProfileView.swift
//  carryonex
//
//  Created by Xin Zou on 8/11/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class UserProfileView: UIView {
    
    
//    let profileView: UIImageView = {
//        let v = UIImageView()
//        //v.backgroundColor = UIColor.green
//        v.layer.cornerRadius = 40
//        v.layer.masksToBounds = true
//        v.image = #imageLiteral(resourceName: "yadianwenqing")
//        return v
//    }()
    
    let nameLabel: UILabel = {
        let b = UILabel()
        b.text = "user name 名字"
        b.font = UIFont.systemFont(ofSize: 20)
        b.textAlignment = .center
        b.backgroundColor = .clear
        return b
    }()
    
    let phoneLabel: UILabel = {
        let b = UILabel()
        b.text = "[xxx.xxx.6666]"
        b.textColor = .lightGray
        b.font = UIFont.systemFont(ofSize: 15)
        b.textAlignment = .center
        b.backgroundColor = .clear
        return b
    }()
    
    private let profileImgHW: CGFloat = 80
    lazy var profileImgButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setTitle(" ", for: .normal)
        b.setImage(#imageLiteral(resourceName: "yadianwenqing"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFill
        b.layer.cornerRadius = 40
        b.layer.masksToBounds = true
        b.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return b
    }()
    
    lazy var isCarrierSegmentControl: UISegmentedControl = {
        let s = UISegmentedControl(items: ["帮我带","帮你带"])
        //s.tintColor = .white
        s.selectedSegmentIndex = 0
        s.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 16)], for: .normal)
        s.addTarget(self, action: #selector(changeUserCarrierState), for: .valueChanged)
        return s
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(nameLabel)
        nameLabel.addConstraints(left: leftAnchor, top: topAnchor, right: rightAnchor, bottom: nil, leftConstent: 0, topConstent: 10, rightConstent: 0, bottomConstent: 0, width: 0, height: 30)
        
        addSubview(phoneLabel)
        phoneLabel.addConstraints(left: leftAnchor, top: nameLabel.bottomAnchor, right: rightAnchor, bottom: nil, leftConstent: 0, topConstent: 5, rightConstent: 0, bottomConstent: 0, width: 0, height: 20)
        
        addSubview(isCarrierSegmentControl)
        isCarrierSegmentControl.addConstraints(left: leftAnchor, top: nil, right: rightAnchor, bottom: bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 0, height: 40)
        
        addSubview(profileImgButton)
        setupProfileImgButton()
        
        
    }
    
    private func setupProfileImgButton(){
        profileImgButton.translatesAutoresizingMaskIntoConstraints = false
        profileImgButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImgButton.widthAnchor.constraint(equalToConstant: profileImgHW).isActive = true
        profileImgButton.heightAnchor.constraint(equalToConstant: profileImgHW).isActive = true
        profileImgButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    
    func changeUserCarrierState(){
        print("selecting at: \(isCarrierSegmentControl.selectedSegmentIndex)")
    }
    
    func profileButtonTapped(){
        print("profileButtonTapped:  should setup user profile image")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


