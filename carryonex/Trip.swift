//
//  Trip.swift
//  carryonex
//
//  Created by Xin Zou on 8/9/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import Foundation
import MapKit


enum Transportation : String {
    case airplane = "Airplane"
    case car = "Car"
    case bus = "Bus"
}


class Trip : NSObject {
    
    var id: String?
    var travelerId: String?
    var transportation: Transportation?
    
    var startLocation: CLLocationCoordinate2D?
    var endLocation: CLLocationCoordinate2D?
    
    
    init(id:String?, travelerId:String?, transportation:Transportation?, startLoc: CLLocationCoordinate2D?, endLoc: CLLocationCoordinate2D?){
        self.id = id
        self.travelerId = travelerId
        self.transportation = transportation
        self.startLocation = startLoc
        self.endLocation = endLoc
    }
    
    
}



