//
//  ExecuteOnceInteractor.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractor {
    var elementTypeKey: String { get }
    func execute(closure: () -> Void)
}
