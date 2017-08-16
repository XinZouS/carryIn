//
//  ViewController.swift
//  carryonex
//
//  Created by Xin Zou on 8/8/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit
import MapKit


class HomePageController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

//    var delegate = HomePageControllerDelegate.self

    var pageContainer: PageContainer?
    
    let mapView : MKMapView = {
        let m = MKMapView()
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    let locationManager = CLLocationManager()
    
    let btnTitleSender: String = "I have goods to send"
    let btnTitleShiper: String = "I want to carry goods"
    
    lazy var callShipperButton : UIButton = {
        let b = UIButton()
        b.layer.cornerRadius = 12
        b.layer.masksToBounds = true
        b.setTitle("I have goods to send", for: .normal)
        b.titleLabel?.font = UIFont(name: buttonFont, size: 20)
        b.backgroundColor = buttonColorPurple
        b.addTarget(self, action: #selector(callShipperButtonTapped), for: .touchUpInside)
        return b
    }()
    
    lazy var userInfoBarButtonView : UIButton = {
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        b.setImage(#imageLiteral(resourceName: "user29x29"), for: .normal)
        b.addTarget(self, action: #selector(showUserInfoSideMenu), for: .touchUpInside)
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.delegate = HomePageControllerDelegate.self
        
        view.addSubview(mapView)
        mapView.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: 0, height: 0)
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsPointsOfInterest = true
        mapView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        view.addSubview(callShipperButton)
        callShipperButton.addConstraints(left: view.leftAnchor, top: nil, right: view.rightAnchor, bottom: view.bottomAnchor, leftConstent: 50, topConstent: 0, rightConstent: 50, bottomConstent: 30, width: 0, height: 50)
        
        setupNavigationBar()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "CarryonEx" // for returning from UserInfoPage, change title back;
    }

    
    private func setupNavigationBar(){
        UINavigationBar.appearance().tintColor = buttonColorPurple
        navigationController?.navigationBar.tintColor = buttonColorPurple
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: buttonColorPurple]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userInfoBarButtonView)
        
        UINavigationBar.appearance().backgroundColor = UIColor()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

