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


extension MapShopListViewController: MKMapViewDelegate {

    func mapViewDidFinishRenderingMap (_ mapView: MKMapView, fullyRendered: Bool) {
        if let shopsCD = self.fetchedResultsController.fetchedObjects {
            for shopCD in shopsCD {
                let annotation = ShopPin(shopCD: shopCD)
                self.shopMap.addAnnotation(annotation)
            }
        }
    }
    
    private func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKPinAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKPinAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView as? MKPinAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "marker")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? ShopPin {
            self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: annotation.shopCD)
        }
    }
}

