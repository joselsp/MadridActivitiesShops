//
//  MapShopListViewController+MapViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 1/10/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import CoreData


extension MapShopListViewController {

    func addShopAnnotations() {
        
        if let shopsCD = self.fetchedResultsController.fetchedObjects {
            for shopCD in shopsCD {
                let annotation = ShopPin(shopCD: shopCD)
                self.shopMap.addAnnotation(annotation)
            }
        }
    }
}

