//
//  CounterTests.swift
//  CounterPlusPlusTests
//
//  Created by Jordi Kitto on 25/11/2022.
//

import XCTest

@testable import CounterPlusPlus

final class CounterTests: XCTestCase {

    func testIncrement() {
        let counter = Counter()
        
        XCTAssertEqual(counter.value, 0)
        
        counter.increaseCounter()
        
        XCTAssertEqual(counter.value, 1)
    }
    
    func testLastChangeDate() {
        let counter = Counter()
        
        let initialDate = counter.lastChangeDate
        
        counter.increaseCounter()
        
        XCTAssertGreaterThan(counter.lastChangeDate, initialDate)
    }

}
