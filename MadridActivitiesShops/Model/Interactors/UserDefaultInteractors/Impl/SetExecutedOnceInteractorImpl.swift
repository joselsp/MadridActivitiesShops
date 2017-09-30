//
//  SetExecutedOnceInteractorImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImpl: SetExecutedOnceInteractor {
    var elementTypeKey: String
    
    init(elementTypeKey: String) {
        self.elementTypeKey = elementTypeKey
    }
    
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: elementTypeKey)
        
        defaults.synchronize()
    }
}
