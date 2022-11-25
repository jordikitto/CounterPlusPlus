//
//  CounterDetailsViewModelTests.swift
//  CounterPlusPlusTests
//
//  Created by Jordi Kitto on 25/11/2022.
//

import XCTest

@testable import CounterPlusPlus

final class CounterDetailsViewModelTests: XCTestCase {

    // THIS IS SUPER HACKY, I'm sure Max C would know how to make this a nice test
    // but you get the gist, you can test the VM!
    func testCounterLastChangeDateSynced() {
        let counter = Counter()
        
        let vm = CounterDetailsView.ViewModel(counter: counter)
        
        let initialTimeSinceLastChange = vm.timeSinceLastChange
        
        counter.increaseCounter()
        
        let timeSinceLastChangeChanged = self.expectation(description: "Time since last change, changed")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            timeSinceLastChangeChanged.fulfill()
        }
        
        wait(for: [timeSinceLastChangeChanged], timeout: 1)
        
        XCTAssertNotEqual(vm.timeSinceLastChange, initialTimeSinceLastChange)
    }

}
