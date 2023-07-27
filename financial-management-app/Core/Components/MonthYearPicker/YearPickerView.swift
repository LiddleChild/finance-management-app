//
//  YearPickerView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/7/2566 BE.
//

import SwiftUI

struct YearPickerView: View {
    @Binding var year: Int
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    year = year + 1
                }
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .padding()
            }
            
            Spacer()
            
            Text(verbatim: String(year))
                .font(.system(size: 20, weight: .semibold))
            
            Spacer()
            
            Button {
                withAnimation {
                    year = year - 1
                }
            } label: {
                Image(systemName: "chevron.right")
                    .imageScale(.large)
                    .padding()
            }
        }
        .foregroundColor(Color("color-5"))
    }
}

private struct Preview: View {
    @State private var yearField = 2023
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            YearPickerView(year: $yearField)
        }
    }
}

struct YearPickerView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
