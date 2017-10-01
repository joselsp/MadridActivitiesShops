//
//  MapActivityListViewController+MapViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 1/10/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import CoreData


extension MapActivityListViewController {
    
    func addActivityAnnotations() {
        
        if let activitiesCD = self.fetchedResultsController.fetchedObjects {
            for activityCD in activitiesCD {
                let annotation = ActivityPin(activityCD: activityCD)
                self.activityMap.addAnnotation(annotation)
            }
        }
    }
}
