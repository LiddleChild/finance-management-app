//
//  MonthYearPicker.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/7/2566 BE.
//

import SwiftUI

struct MonthYearPicker: View {
    @Binding var value: MonthYearPickerValue
    
    var body: some View {
        VStack(spacing: 0) {
            YearPickerView(year: $value.Year)
            MonthPickerView(month: $value.Month)
        }
    }
}

private struct Preview: View {
    @State private var value = MonthYearPickerValue(Month: 10, Year: 2023)
    @State private var date = Date()
    
    var body: some View {
        ContentTemplate {
            MonthYearPicker(value: $value)
        }
    }
}

struct MonthYearPicker_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
