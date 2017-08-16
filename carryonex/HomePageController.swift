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
    
    // for searchController:
    var searchDataPool : [String] = ["apple", "ball", "cat", "dog", "elf", "friends", "God"]
    var searchFilteredResult : [String] = []
    
//    var searchController = UISearchController()
    
    let searchCellId: String = "searchCellId"
    var searchContainerView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    var tableView = UITableView() // for search results
    lazy var searchButton : UIButton = { // replaced by searchController
        let b = UIButton()
        b.backgroundColor = .white
        b.setImage(#imageLiteral(resourceName: "search29x29"), for: .normal)
        b.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return b
    }()
    
    let searchTextField : UITextField = {
        let t = UITextField()
        t.placeholder = " 搜索地址"
        return t
    }()

    
    let btnTitleShipForMe : String = "帮我带"
    let btnTitleShipForYou: String = "帮你带"
    
    var isSideBtnViewShowing : Bool = false
    let sideBtnW : CGFloat = 40
    let sideBtnViewH: CGFloat = 40
    let sideButtonContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 20 // bcz w,h = 40
        v.layer.masksToBounds = true
        return v
    }()
    var sideBtnCtnViewLeftConstraint: NSLayoutConstraint? // for moving side buttonView
    
    lazy var pullSideBtnViewButton : UIButton = {
        let b = UIButton()
        b.backgroundColor = .white
        b.setImage(#imageLiteral(resourceName: "user29x29"), for: .normal)
        b.addTarget(self, action: #selector(pullSideButtonTapped), for: .touchUpInside)
        return b
    }()
    
    let switchUserTypeAttributes : [String:Any] = [ // for button title setting
        NSFontAttributeName: UIFont.systemFont(ofSize: 16),
        NSForegroundColorAttributeName: UIColor.black
    ]
    
    lazy var switchUserTypeButton : UIButton = {
        let b = UIButton()
        b.backgroundColor = .white
        b.addTarget(self, action: #selector(switchUserType), for: .touchUpInside)
        return b
    }()
    
    lazy var callShipperButton : UIButton = {
        let b = UIButton()
        b.layer.cornerRadius = 30
        b.layer.masksToBounds = true
        //b.setTitle("send", for: .normal)
        //b.titleLabel?.font = UIFont(name: buttonFont, size: 20)
        b.setImage(#imageLiteral(resourceName: "CarryonExIcon-29"), for: .normal)
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
    
    lazy var giftBarButtonView: UIButton = {
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        b.setImage(#imageLiteral(resourceName: "search29x29"), for: .normal)
        b.addTarget(self, action: #selector(showGiftController), for: .touchUpInside)
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.delegate = HomePageControllerDelegate.self
        

        setupNavigationBar()
        
        setupMapView()
        
        setupSearchContents()
        setupSearchTableView()
        
        setupCallShipperButton()
        
        setupSideButtonView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "CarryonEx" // for returning from UserInfoPage, change title back;
    }

    private func setupNavigationBar(){
        UINavigationBar.appearance().tintColor = buttonColorPurple
        navigationController?.navigationBar.tintColor = buttonColorPurple
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: buttonColorPurple]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userInfoBarButtonView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: giftBarButtonView)
    }
    
    private func setupMapView(){
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
    }
    
    private func setupSearchContents(){
        let margin: CGFloat = 40
        let h: CGFloat = 40
        
        view.addSubview(searchContainerView)
        searchContainerView.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: view.rightAnchor, bottom: nil, leftConstent: margin, topConstent: 90, rightConstent: margin, bottomConstent: 0, width: 0, height: h)
        
        setupTableView()
        
        view.addSubview(searchButton)
        searchButton.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: nil, bottom: nil, leftConstent: margin, topConstent: 90, rightConstent: 0, bottomConstent: 0, width: h, height: h)
        
        view.addSubview(searchTextField)
        searchTextField.addConstraints(left: searchButton.rightAnchor, top: searchButton.topAnchor, right: view.rightAnchor, bottom: searchButton.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: margin, bottomConstent: 0, width: 0, height: h)
        
    }
    
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.addConstraints(left: searchContainerView.leftAnchor, top: searchContainerView.bottomAnchor, right: searchContainerView.rightAnchor, bottom: nil, leftConstent: 0, topConstent: 6, rightConstent: 0, bottomConstent: 0, width: 0, height: 300)
     
        tableView.isHidden = true
    }

    private func setupCallShipperButton(){
        view.addSubview(callShipperButton)
        callShipperButton.addConstraints(left: nil, top: nil, right: nil, bottom: view.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 30, width: 60, height: 60)
        callShipperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupSideButtonView(){
        view.addSubview(sideButtonContainerView)
        sideButtonContainerView.addConstraints(left: nil, top: view.topAnchor, right: nil, bottom: nil, leftConstent: 0, topConstent: 160, rightConstent: 0, bottomConstent: 0, width: 130, height: sideBtnViewH)
        sideBtnCtnViewLeftConstraint = sideButtonContainerView.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -sideBtnW)
        sideBtnCtnViewLeftConstraint?.isActive = true
        
        sideButtonContainerView.addSubview(pullSideBtnViewButton)
        pullSideBtnViewButton.addConstraints(left: sideButtonContainerView.leftAnchor, top: sideButtonContainerView.topAnchor, right: nil, bottom: sideButtonContainerView.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: 0, bottomConstent: 0, width: sideBtnW, height: 0)
        
        sideButtonContainerView.addSubview(switchUserTypeButton)
        switchUserTypeButton.addConstraints(left: pullSideBtnViewButton.rightAnchor, top: sideButtonContainerView.topAnchor, right: sideButtonContainerView.rightAnchor, bottom: sideButtonContainerView.bottomAnchor, leftConstent: 0, topConstent: 0, rightConstent: sideBtnW / 2 + 10, bottomConstent: 0, width: 0, height: 0)
        setupSwitchUserTypeBtnTitle(str: btnTitleShipForYou)
        
        setupSwipGestureRecognizer()
    }

    func setupSwitchUserTypeBtnTitle(str: String){
        let attriStr = NSMutableAttributedString(string: str, attributes: switchUserTypeAttributes)
        switchUserTypeButton.setAttributedTitle(attriStr, for: .normal)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

