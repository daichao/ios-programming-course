//
//  CoffeeAPI.swift
//  Coffee
//
//  Created by daichao on 15/12/30.
//  Copyright © 2015年 daichao. All rights reserved.
//

import Foundation
import QuadratTouch
import MapKit
import RealmSwift

struct API{
    struct notifictions {
        static let venuesUpdated="venues updated"
    }
}

class CoffeeAPI{
    static let sharedInstance=CoffeeAPI()
    var session:Session?
    
    init(){
        let client = Client(clientID: "X4I3CFADAN4MEB2TEVYUZSQ4SHSTXSZL34VNP4CJHSJGLKPV", clientSecret: "EDOLJK3AGCOQDRKVT2GK5E4GECU42UJUCGGWLTUFNEF1ZXHB", redirectURL: "")
        let configuration=Configuration(client: client)
        Session.setupSharedSessionWithConfiguration(configuration)
        self.session=Session.sharedSession()
    }
    func getCoffeeShopsWithLocation(location:CLLocation)
    {
        if let session = self.session
        {
            var parameters = location.parameters()
            parameters += [Parameter.categoryId: "4bf58dd8d48988d1e0931735"]
            parameters += [Parameter.radius: "2000"]
            parameters += [Parameter.limit: "50"]
            
            // Start a "search", i.e. an async call to Foursquare that should return venue data
            let searchTask = session.venues.search(parameters)
                {
                    (result) -> Void in
                    
                    if let response = result.response
                    {
                        if let venues = response["venues"] as? [[String: AnyObject]]
                        {
                            autoreleasepool
                                {
                                    let realm = try! Realm()
                                    realm.beginWrite()
                                    
                                    for venue:[String: AnyObject] in venues
                                    {
                                        let venueObject:Venue = Venue()
                                        
                                        if let id = venue["id"] as? String
                                        {
                                            venueObject.id = id
                                        }
                                        
                                        if let name = venue["name"] as? String
                                        {
                                            venueObject.name = name
                                        }
                                        
                                        if  let location = venue["location"] as? [String: AnyObject]
                                        {
                                            if let longitude = location["lng"] as? Float
                                            {
                                                venueObject.longitude = longitude
                                            }
                                            
                                            if let latitude = location["lat"] as? Float
                                            {
                                                venueObject.latitude = latitude
                                            }
                                            
                                            if let formattedAddress = location["formattedAddress"] as? [String]
                                            {
                                                venueObject.address = formattedAddress.joinWithSeparator(" ")
                                            }
                                        }
                                        
                                        realm.add(venueObject, update: true)
                                    }
                                    
                                    do {
                                        try realm.commitWrite()
                                        print("Committing write...")
                                    }
                                    catch (let e)
                                    {
                                        print("Y U NO REALM ? \(e)")
                                    }
                            }
                            
                            NSNotificationCenter.defaultCenter().postNotificationName(API.notifictions.venuesUpdated, object: nil, userInfo: nil)
                        }
                    }
            }
            
            searchTask.start()
        }
    }
}

extension CLLocation{
    func parameters()->Parameters{
        let ll="\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc="\(self.horizontalAccuracy)"
        let alt="\(self.altitude)"
        let altAcc="\(self.verticalAccuracy)"
        let parameters=[
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}

