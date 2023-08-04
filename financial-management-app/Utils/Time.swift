//
//  Time.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 4/8/2566 BE.
//

import Foundation

class Time {
    static func getCurrentMonth() -> Int {
        return Calendar(identifier: .gregorian).component(.month, from: Date())
    }
    
    static func getCurrentYear() -> Int {
        return Calendar(identifier: .gregorian).component(.year, from: Date())
    }
}
