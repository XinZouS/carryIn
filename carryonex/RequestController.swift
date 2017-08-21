//
//  RequestController.swift
//  carryonex
//
//  Created by Xin Zou on 8/20/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit

class RequestController: UIViewController {
    
    var costByItem: Float32 = 0.0
    
    let labelW : CGFloat = 90
    
    let departureLabel : UILabel = {
        let b = UILabel()
        b.backgroundColor = .green
        b.text = "出发地：" // "Departure From:"
        return b
    }()
    
    let departureTextField : UITextField = {
        let t = UITextField()
        t.backgroundColor = .cyan
        t.placeholder = "请选择您的出发地址"
        return t
    }()
    
    let destinationLabel : UILabel = {
        let b = UILabel()
        b.backgroundColor = .green
        b.text = "目的地：" // "Destination: "
        return b
    }()
    
    lazy var destinationTextField : UITextField = {
        let t = UITextField()
        t.backgroundColor = .cyan
        t.placeholder = "请选择您的寄送地址"
        return t
    }()
    
    let volumeLabel : UILabel = {
        let b = UILabel()
        b.textAlignment = .right
        return b
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        
    }
    
    
    
    
    
    
}



