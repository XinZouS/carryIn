//
//  ItemTypeListController.swift
//  carryonex
//
//  Created by Xin Zou on 8/19/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class ItemTypeListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    /// class ItemCategory()
    var itemTypes : [ItemCategory] = []
    
    let cellId = "ItemTypeListCellId"
    
    lazy var submitButton : UIButton = {
        let b = UIButton()
        b.backgroundColor = buttonThemeColor
        b.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        b.setTitle("确认清单", for: .normal)
        return b
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addItemTypesToList()
        
        setupNavigationBar()
        
        setupCollectionView()
        
        setupSubmitButton()
    }
    
    private func addItemTypesToList(){
        
        let mail        = ItemCategory(nameCn: "信件", nameEn: "Mail", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let clothes     = ItemCategory(nameCn: "服装", nameEn: "Clothes", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let shoes       = ItemCategory(nameCn: "鞋子", nameEn: "Shoes", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let handbag     = ItemCategory(nameCn: "手袋", nameEn: "Handbag", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let food        = ItemCategory(nameCn: "食品", nameEn: "Food", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let healthCare  = ItemCategory(nameCn: "医疗保健品", nameEn: "HealthCare", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let electronics = ItemCategory(nameCn: "电子产品", nameEn: "Electronics", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let cosmetic    = ItemCategory(nameCn: "美妆用品", nameEn: "Cosmetics", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        let jewelry     = ItemCategory(nameCn: "饰品", nameEn: "Jewelry", iconImg: #imageLiteral(resourceName: "yadianwenqing"))
        
        itemTypes.append(mail)
        itemTypes.append(clothes)
        itemTypes.append(shoes)
        itemTypes.append(handbag)
        itemTypes.append(food)
        itemTypes.append(healthCare)
        itemTypes.append(electronics)
        itemTypes.append(cosmetic)
        itemTypes.append(jewelry)
    }
    
    
    private func setupCollectionView(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
        }
        collectionView?.backgroundColor = .lightGray
        
        // reset content area: UIEdgeInsetsMake(top, left, bottom, right)
        //collectionView?.contentInset = UIEdgeInsetsMake(0, 20, 50, 20) // replaced by constraints:
        collectionView?.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, leftConstent: 20, topConstent: 0, rightConstent: 20, bottomConstent: 40, width: 0, height: 0)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(ItemTypeListCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isScrollEnabled = true
    }
    
    private func setupSubmitButton(){
        view.addSubview(submitButton)
        submitButton.addConstraints(left: view.leftAnchor, top: nil, right: view.rightAnchor, bottom: view.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 0, height: 40)
    }

    
    
    /// collectionView delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemTypes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemTypeListCell
        cell.itemCategory = itemTypes[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    
    
    
}

