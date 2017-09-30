//
//  DownloadAllActivitiesInteractorNSURLSessionImpl.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSURLSessionImpl: DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        
        let urlString = Constant.urlActivities
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    
                    if error == nil {
                        // OK
                        
                        let activities = parseActivities(data: data!)
                        onSuccess(activities)
                    } else {
                        // Error
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}
