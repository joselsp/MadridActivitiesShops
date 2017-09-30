//
//  SaveAllActivitiesInteractorImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import CoreData

class SaveAllActivitiesInteractorImpl: SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        
        for i in 0 ..< activities.count() {
            let activity = activities.get(index: i)
            
            // mapping shop into ShopCD
            let _ = mapActivityIntoActivityCD(context: context, activity: activity)
        }
        
        do {
            try context.save()
            onSuccess(activities)
        } catch {
            // onError(nil)
        }
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
}

