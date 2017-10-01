//
//  ExecuteOnceInteractorImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor {
    var elementTypeKey: String
    
    init(elementTypeKey: String) {
        self.elementTypeKey = elementTypeKey
    }
    
    func execute(closure: () -> Void, cached: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: elementTypeKey) {
            // already saved
            cached()
        } else {    // first time
            closure()
        }
    }
}
