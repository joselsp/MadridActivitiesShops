//
//  DownloadAllShopsInteractor.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    //execute: download all shops. Return on the main thread
    func execute(onSuccess: @escaping(Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping(Shops) -> Void)
}

protocol DownloadAllActivitiesInteractor {
    //execute: download all shops. Return on the main thread
    func execute(onSuccess: @escaping(Activities) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping(Activities) -> Void)
}
