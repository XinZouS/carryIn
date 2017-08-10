//
//  SideMenuLeftController.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


class UserContentCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class SideMenuLeftController: UITableViewController {
    
    
    let cellId = "UserContentCellId"
    
    let userInfoView = SideMenuUserInfoView()
    let userInfoHeigh : CGFloat = 80
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setupUserInfoView()
        
    }
    
    
    private func setupTableView(){
        
        tableView.register(UserContentCell.self, forCellReuseIdentifier: cellId)
        tableView.contentInset = UIEdgeInsetsMake(userInfoHeigh, 0, 30, 0) // set range of tableView
        
    }
    
    private func setupUserInfoView(){
        view.addSubview(userInfoView)
        userInfoView.addConstraints(left: view.leftAnchor, top: view.topAnchor, right: nil, bottom: nil, leftConstent: 0, topConstent: -userInfoHeigh, rightConstent: 0, bottomConstent: 0, width:  centerPanelExpandedOffset, height: 80)
    }
    
    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserContentCell
        cell.textLabel?.text = "test row \(indexPath.row)"
        return cell
    }
    

    // Mark: Table View Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SideMenuLeftController: select row: \(indexPath.row)")
    }
    
    
}


