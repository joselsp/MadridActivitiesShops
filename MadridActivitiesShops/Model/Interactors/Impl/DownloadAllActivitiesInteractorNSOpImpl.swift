//
//  DownloadAllActivitiesInteractorNSOpImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSOpImpl: DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure = nil) {
        
        let urlString = Constant.urlActivities
        
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                
                let activities = parseActivities(data: data)
                
                OperationQueue.main.addOperation {
                    onSuccess(activities)
                }
            }
        }
    }
}
