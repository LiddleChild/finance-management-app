//
//  MonthPickerView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/7/2566 BE.
//

import SwiftUI

struct MonthPickerView: View {
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    @Binding var month: Int
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Array(months.enumerated()), id: \.offset) { index, m in
                        Button {
                            withAnimation {
                                month = index + 1
                            }
                        } label: {
                            if index + 1 == month {
                                Text(m)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color("color-4"))
                                    .padding()
                            } else {
                                Text(m)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color("color-5"))
                                    .padding()
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                value.scrollTo(month - 1, anchor: .center)
            }
        }
    }
}

private struct Preview: View {
    @State private var monthField = 12
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            MonthPickerView(month: $monthField)
        }
    }
}

struct MonthPickerView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
