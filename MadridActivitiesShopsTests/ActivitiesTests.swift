//
//  ActivitiesTests.swift
//  MadridActivitiesShopsTests
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import XCTest
import MadridActivitiesShops

class ActivitiesTests: XCTestCase {
    
    func testGivenEmptyActivitiesNumberActivityIsZero() {
        let sut = Activities()
        
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenActivityWithOneElementNumberActivityIsOne() {
        let sut = Activities()
        sut.add(activity: Activity(name: "Activity"))
        
        XCTAssertEqual(1, sut.count())
    }
}
