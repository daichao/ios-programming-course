//
//  CoffeeAnnotation.swift
//  Coffee
//
//  Created by daichao on 15/12/30.
//  Copyright © 2015年 daichao. All rights reserved.
//

import Foundation
import MapKit

class CoffeeAnnotation: NSObject, MKAnnotation
{
    let title:String?
    let subtitle:String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle:String?, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }    
}