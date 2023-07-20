//
//  AddTransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject private var amountField: NumbersOnly = NumbersOnly()
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        //        formatter.numberStyle = .currency
        //        formatter.maximumFractionDigits = 2
        //        formatter.groupingSeparator = ","
        //        formatter.usesGroupingSeparator = true
        //        formatter.currencySymbol = "THB"
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                
                HStack {
                    TextField("Amount", text: $amountField.value)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 28, weight: .regular))
                    
                    Text("THB")
                        .font(.system(size: 16, weight: .regular))
                }
                .foregroundColor(Color("color-5"))
                .padding(8)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color("color-3"))
                }
            }
            .padding(.horizontal, 24)
        }
        .toolbarBackground(Color("color-1"), for: .navigationBar)
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddTransactionView()
                .toolbar(.visible)
        }
    }
}
