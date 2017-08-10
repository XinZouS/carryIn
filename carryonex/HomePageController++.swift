//
//  HomePageController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit



extension HomePageController {
    
    func changeUserType() {
        print("HomePageController++.swift: change user type!!!")
    }
    
    func callShipperButtonTapped(){
        print("HomePageController++.swift: call shipper button tapped!!!!!")
    }
    
    func showUserInfoSideMenu(){
        self.pageContainer?.toggleLeftPanel()
        print("HomePageController++.swift: showUserInfoSideMenu!! ")
    }
    

    
}
