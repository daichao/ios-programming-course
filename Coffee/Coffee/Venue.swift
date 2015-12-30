//
//  Venue.swift
//  Coffee
//
//  Created by daichao on 15/12/30.
//  Copyright © 2015年 daichao. All rights reserved.
//

import Foundation
import MapKit
import RealmSwift

class Venue:Object {
    dynamic var id:String = ""
    dynamic var name:String = ""
    
    dynamic var latitude:Float = 0
    dynamic var longitude:Float = 0
    
    dynamic var address:String = ""
    
    var coordinate:CLLocation{
        return CLLocation(latitude: Double(latitude), longitude: Double(longitude))
        
    }
    
    override static func primaryKey() -> String?
    {
        return "id";
    }
}