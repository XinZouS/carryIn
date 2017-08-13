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
        if true {
            
        }else{
            // go to SendRequest
        }
        print("HomePageController++.swift: call shipper button tapped!!!!!")
    }
    
    func showUserInfoSideMenu(){
        
        let userInfoVC = UserInfoViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        navigationController?.pushViewController(userInfoVC, animated: true)
        navigationItem.title = "  " //for change "< Back" as "<"
        pushViewFromLeftToRight(destVC: userInfoVC)
        
        // plan A: with slide-out menu
        //self.pageContainer?.toggleLeftPanel()
    }
    
    private func pushViewFromLeftToRight(destVC: UIViewController){
        // push navigationController from left-->right
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(destVC, animated: false)
    }
    

    
}



