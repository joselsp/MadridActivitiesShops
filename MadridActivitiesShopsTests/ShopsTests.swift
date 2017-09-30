//
//  ShopsTests.swift
//  MadridActivitiesShopsTests
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import XCTest
import MadridActivitiesShops

class ShopsTests: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero() {
        let sut = Shops()
        
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopWithOneElementNumberShopIsOne() {
        let sut = Shops()
        sut.add(shop: Shop(name: "Shop"))
        
        XCTAssertEqual(1, sut.count())
    }
}
