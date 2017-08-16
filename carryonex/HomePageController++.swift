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
        // replace above by custimize transit animation:
        navigationItem.title = "  " //for change "< Back" as "<"
        pushViewFromLeftToRight(destVC: userInfoVC)
        
        // plan A: with slide-out menu
        //self.pageContainer?.toggleLeftPanel()
    }
    
    func pullSideButtonTapped(){
        let offset = switchUserTypeButton.bounds.width
        if isSideBtnViewShowing {
            sideBtnCtnViewLeftConstraint?.constant += offset
        }else{
            sideBtnCtnViewLeftConstraint?.constant -= offset
        }
        isSideBtnViewShowing = !isSideBtnViewShowing
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1.6, initialSpringVelocity: 1.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func switchUserType(){
        let s = User.sharedInstance.isShipper
        User.sharedInstance.isShipper = !(s ?? false)
        let uStr = User.sharedInstance.isShipper! ? btnTitleShipForMe : btnTitleShipForYou
        setupSwitchUserTypeBtnTitle(str: uStr)
        print("now I am a sipper == \(User.sharedInstance.isShipper!), I can change to \(uStr)")
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
    
    func setupSwipGestureRecognizer(){
        let swipLeft = UISwipeGestureRecognizer(target: sideButtonContainerView, action: #selector(swiped))
        
        let swipRight = UISwipeGestureRecognizer(target: sideButtonContainerView, action: #selector(swiped))
    }

    func swiped(_ gesture: UIGestureRecognizer){
        guard let swipeGesture = gesture as? UISwipeGestureRecognizer else { return }
        
        switch swipeGesture.direction {
        case UISwipeGestureRecognizerDirection.left:
            pullSideButtonTapped()
        case UISwipeGestureRecognizerDirection.right:
            pullSideButtonTapped()
        default:
            break
        }
    }

    
}



