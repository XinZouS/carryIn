//
//  UserInfoView.swift
//  carryonex
//
//  Created by Xin Zou on 8/10/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit



class UserInfoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let contents: [String] = ["订单记录","我的钱包","邀请好友","计费标准","需要帮助"]
    
    private let userInfoCellId = "userInfoCellId"
    
    private let userProfileH: CGFloat = 160
    
    private let userProfileView = UserProfileView()
    
    private let margin: CGFloat = 40
    
    lazy var logoutButton: UIButton = {
        let b = UIButton()
        b.setTitle("退出登陆", for: .normal)
        b.setImage( UIImage.init(named: "CarryonEx_Exit.png"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        //b.backgroundColor = buttonColorRed
        b.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return b
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
        setupCollectionView()
        
        setupUserProfileView()
        
        setupLogoutButton()
        
    }
    
    private func setupNavigationBarItems(){
        navigationItem.title = "我的帐户"
        
        let leftBackBtn = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(dismissSelfToLeft))
        navigationItem.setLeftBarButton(leftBackBtn, animated: false)
    }
    
    private func setupCollectionView(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
        }
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsetsMake(userProfileH + 30, margin, 50, margin) // top, left, bottom, right;
        collectionView?.isScrollEnabled = false
        collectionView?.isPagingEnabled = false
        
        collectionView?.register(UserInfoViewCell.self, forCellWithReuseIdentifier: userInfoCellId)
    }
    
    private func setupUserProfileView(){
        view.addSubview(userProfileView)
        userProfileView.addConstraints(left: view.leftAnchor, top: nil, right: view.rightAnchor, bottom: nil, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 0, height: userProfileH)
        userProfileView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLogoutButton(){
        view.addSubview(logoutButton)
        logoutButton.addConstraints(left: view.leftAnchor, top: nil, right: nil, bottom: view.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 40, height: 40)
    }

     
    
    
    // MARK: CollectionView delegate
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userInfoCellId, for: indexPath) as! UserInfoViewCell
        cell.titleLabel.text = contents[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w: CGFloat = UIScreen.main.bounds.width - (margin * 2)
        let h: CGFloat = 50
        return CGSize(width: w, height: h)
    }
    
    
    
    
    func logoutButtonTapped(){
        self.navigationController?.popToRootViewController(animated: false)
        
        let phoneNumNavCtl = UINavigationController(rootViewController: PhoneNumberController())
        present(phoneNumNavCtl, animated: true) { 
            print("finish present phoneNumNavCtl.")
        }
        print("logout user!!!!!!")
    }
    
    
}


