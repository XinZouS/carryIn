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
    
    private let userProfileH: CGFloat = 120
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
        setupCollectionView()
        
        setupUserProfileView()
        
    }
    
    private func setupNavigationBarItems(){
        
    }
    
    private func setupCollectionView(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
        }
        collectionView?.backgroundColor = .gray
        collectionView?.contentInset = UIEdgeInsetsMake(userProfileH, 0, 0, 0)
        collectionView?.isScrollEnabled = false
        collectionView?.isPagingEnabled = false
        
        collectionView?.register(UserInfoViewCell.self, forCellWithReuseIdentifier: userInfoCellId)
    }
    
    private func setupUserProfileView(){
        
        
        
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
    
    
    
}


