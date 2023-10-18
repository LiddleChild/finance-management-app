//
//  MonthYearPicker.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/7/2566 BE.
//

import SwiftUI

struct MonthYearPicker: View {
    @State private var isShowingOption: Bool = false
    @Binding var value: MonthYearPickerValue
    
    var body: some View {
        Text("\(value.getMonthName()), \(String(value.Year))")
            .foregroundColor(Color.color5)
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(isShowingOption ? Color.color4 : Color.color2)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.25)) {
                    isShowingOption.toggle()
                }
            }
            .overlay(alignment: .top) {
                if isShowingOption {
                    VStack(spacing: 0) {
                        YearPickerView(year: $value.Year)
                        MonthPickerView(month: $value.Month)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color.color2)
                    )
                    .offset(y: 52)
                    .transition(.scale)
                }
            }
            .foregroundColor(Color.color5)
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
