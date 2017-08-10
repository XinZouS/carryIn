//
//  SideMenuUserInfoView.swift
//  carryonex
//
//  Created by Xin Zou on 8/10/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit

class SideMenuUserInfoView: UIView {
    
    let profileView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = UIColor.green
        return v
    }()
    
    let nameLabel: UILabel = {
        let b = UILabel()
        b.text = "user name"
        b.backgroundColor = .yellow
        return b
    }()
    
    let subLabel: UILabel = {
        let b = UILabel()
        b.text = "detail information"
        b.backgroundColor = UIColor.cyan
        return b
    }()
    
    lazy var infoButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .red
        b.setTitle(">", for: .normal)
        b.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        profileView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(infoButton)
        infoButton.addConstraints(left: nil, top: topAnchor, right: rightAnchor, bottom: bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 40, height: 0)
        
        addSubview(nameLabel)
        nameLabel.addConstraints(left: profileView.rightAnchor, top: topAnchor, right: infoButton.leftAnchor, bottom: nil, leftConstent: 20, topConstent: 20, rightConstent: 20, bottomConstent: 0, width: 0, height: 20)
        
        addSubview(subLabel)
        subLabel.addConstraints(left: profileView.rightAnchor, top: nameLabel.bottomAnchor, right: infoButton.leftAnchor, bottom: nil, leftConstent: 20, topConstent: 10, rightConstent: 20, bottomConstent: 0, width: 0, height: 20)
        
    }
    
    func infoButtonTapped(){
        print("show user information page!!")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

