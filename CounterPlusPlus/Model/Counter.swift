//
//  Counter.swift
//  CounterPlusPlus
//
//  Created by Jordi Kitto on 25/11/2022.
//

import Foundation

final class Counter: ObservableObject {
    @Published private(set) var value: UInt = 0 {
        didSet {
            lastChangeDate = Date()
        }
    }
    @Published private(set) var lastChangeDate: Date = Date()
    
    func increaseCounter() {
        value += 1
    }
    
    func resetCounter() {
        value = 0
    }
}
