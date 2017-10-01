//
//  Annotations.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 1/10/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import MapKit

class ShopPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String?
    var subtitle: String?
    let shopCD: ShopCD?
    
    init(shopCD: ShopCD) {
        self.shopCD = shopCD
        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: shopCD.latitude)!, longitude: CLLocationDegrees(exactly: shopCD.longitude)!)
        self.title = shopCD.name
        self.subtitle = shopCD.openingHours
    }
}

class ActivityPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String?
    var subtitle: String?
    let activityCD: ActivityCD?
    
    init(activityCD: ActivityCD) {
        self.activityCD = activityCD
        self.coordinate.latitude = CLLocationDegrees(activityCD.latitude)
        self.coordinate.longitude = CLLocationDegrees(activityCD.longitude)
        self.title = activityCD.name
        self.subtitle = activityCD.openingHours
    }
}
