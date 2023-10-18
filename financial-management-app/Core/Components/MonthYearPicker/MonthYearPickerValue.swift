//
//  MonthYearPickerValue.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/7/2566 BE.
//

import Foundation

struct MonthYearPickerValue {
    var Month: Int
    var Year: Int
}

extension MonthYearPickerValue {
    func getMonthName() -> String {
        return [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ][Month - 1];
    }
}
