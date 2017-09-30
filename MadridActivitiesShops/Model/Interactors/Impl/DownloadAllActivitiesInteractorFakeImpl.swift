//
//  DownloadAllActivitiesInteractorFakeImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit

class DownloadAllActivitiesInteractorFakeImpl: DownloadAllActivitiesInteractor{
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure = nil) {
        let activities = Activities()
        
        for i in 0...10 {
            let activity = Activity(name: "Activity number \(i)")
            activity.address = "Address \(i)"
            activity.openingHours = "10:00 - 21:00"
            activity.logo = "activityIcon"
            activities.add(activity: activity)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(activities)
        }
    }
}

