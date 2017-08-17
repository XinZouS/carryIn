//
//  HomePageController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit
import MapKit


extension HomePageController: UITableViewDelegate, UITableViewDataSource {
    
    func searchButtonTapped(){
        print("searchButtonTapped!!!")
    }
    
    // MARK: - Table view data source
    
    func setupSearchTableView(){
        tableView.register(HomePageTableCell.self, forCellReuseIdentifier: searchCellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchFilteredResult.count != 0 ? searchFilteredResult.count : searchDataPool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchCellId, for: indexPath)
        
        if searchFilteredResult.count > 0 {
            cell.textLabel?.text = searchFilteredResult[indexPath.row]
        } else {
            cell.textLabel?.text = searchDataPool[indexPath.row]
        }
        return cell
    }
    
    

    
    func callShipperButtonTapped(){
        if User.sharedInstance.isVerified {
            let isShipper = User.sharedInstance.isShipper
            if isShipper {
                print("TODO: push TripPostController!!!")
            }else{
                print("TODO: push SendRequestCollectionViewController!!!")
            }
        }else{
            let verifyView = PhotoIDController()
//            let verifyNvg = UINavigationController(rootViewController: verifyView) // for single page
//            present(verifyNvg, animated: false, completion: nil)
            navigationController?.pushViewController(verifyView, animated: true) // for navigation page
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
    
    func showGiftController(){
        print("TODO: showGiftController!!!!!!")
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
        let uStr = User.sharedInstance.isShipper ? btnTitleShipForMe : btnTitleShipForYou
        setupSwitchUserTypeBtnTitle(str: uStr)
        print("now I am a sipper == \(User.sharedInstance.isShipper), I can change to \(uStr)")
        
        flipPageHorizontally()
    }
    
    private func flipPageHorizontally(){
        var rotate3D = CATransform3DIdentity
        rotate3D.m34 = 1.0 / -1000
        rotate3D = CATransform3DRotate(rotate3D, CGFloat(M_PI / 0.3), 0.0, 1.0, 0.0)
        view.layer.transform = rotate3D
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.6, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layer.transform = CATransform3DIdentity
        }, completion: nil)
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

    
    func zoomToUserLocation(){
        
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsPointsOfInterest = true
        mapView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        // zoom in to user location
        guard let loc = locationManager.location?.coordinate else { return }
        let viewRegion = MKCoordinateRegionMakeWithDistance(loc, 600, 600)
        mapView.setRegion(viewRegion, animated: false)
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }

    
}




