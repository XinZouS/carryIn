//
//  ItemTypeListController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/19/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


extension ItemTypeListController {
    
    
    func setupNavigationBar(){
        navigationItem.title = "货物清单"
        
        let barBtn = UIBarButtonItem(title: "确认", style: .plain, target: self, action: #selector(submitButtonTapped))
        navigationItem.rightBarButtonItem = barBtn
    }

    func submitButtonTapped(){
        print("TODO: submitButtonTapped!! push next page!!!!")
        
        let requestCtl = RequestController()
        requestCtl.costByItem = 16.66
        navigationController?.pushViewController(requestCtl, animated: true)
    }
    
    
}
