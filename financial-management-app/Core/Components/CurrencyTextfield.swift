//
//  CurrencyTextfield.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value: String = "" {
        didSet {
            let filtered = value.filter { $0.isNumber || $0 == "." || $0 == "," }
            let numberOfDots = value.reduce(0) { $1 == "." ? $0 + 1 : $0 }

            if value != filtered {
                value = filtered
            }
            
            if numberOfDots > 1 {
                value = String(value.dropLast())
            }
        }
    }
}

struct CurrencyTextfield: View {
    @FocusState private var isFocus: Bool
    @Binding var value: String
    
    var body: some View {
        HStack {
            TextField("", text: $value)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 24, weight: .regular))
                .background {
                    // Placeholder
                    if value == "" {
                        Text(verbatim: "0.00")
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(Color("color-3"))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            
            Text("THB")
                .font(.system(size: 16, weight: .regular))
        }
        .foregroundColor(Color("color-5"))
        .focused($isFocus)
        .focusablePadding(.all, 8)
        .background(alignment: .bottom) {
            ZStack {
                // Underline
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color("color-\(isFocus ? 4 : 3)"))
                
            }
        }
    }
}

private struct Preview: View {
    @ObservedObject var amountField: NumbersOnly = NumbersOnly()
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                CurrencyTextfield(value: $amountField.value)
                    .padding(24)
                
                Text(verbatim: String(amountField.value))
                    .foregroundColor(.white)
            }
        }
    }
}

struct CurrencyTextfield_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
