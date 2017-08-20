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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addItemTypesToList()
        
        setupCollectionView()
        
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
        collectionView?.backgroundColor = .white
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(ItemTypeListCell.self, forCellWithReuseIdentifier: cellId)
        // reset content area: UIEdgeInsetsMake(top, left, bottom, right)
        //collectionView?.contentInset = UIEdgeInsetsMake(30, 0, 30, 0)
        collectionView?.isScrollEnabled = true
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
        return CGSize(width: view.frame.width, height: 56)
    }
    
    
    
    
    
    
}

