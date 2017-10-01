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


extension MapActivityListViewController: MKMapViewDelegate {
    
    func mapViewDidFinishRenderingMap (_ mapView: MKMapView, fullyRendered: Bool) {        
        if let activitiesCD = self.fetchedResultsController.fetchedObjects {
            for activityCD in activitiesCD {
                let annotation = ActivityPin(activityCD: activityCD)
                self.activityMap.addAnnotation(annotation)
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
        if let annotation = view.annotation as? ActivityPin {
            self.performSegue(withIdentifier: "ShowActivityDetailSegue", sender: annotation.activityCD)
        }
    }
}
