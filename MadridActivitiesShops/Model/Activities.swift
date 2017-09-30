//
//  Activities.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

public protocol ActivitiesProtocol {
    func count() -> Int
    func add(activity: Activity)
    func get(index: Int) -> Activity
}

public class Activities: ActivitiesProtocol {
    
    private var activitiesList: [Activity]?
    
    public init() {
        self.activitiesList = []
    }
    
    public func count() -> Int {
        return (activitiesList?.count)!
    }
    
    public func add(activity: Activity) {
        activitiesList?.append(activity)
    }
    
    public func get(index: Int) -> Activity {
        return (activitiesList?[index])!
    }
}
