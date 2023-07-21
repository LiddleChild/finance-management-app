//
//  AddTransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var viewModel: ViewModel
    @ObservedObject private var amountField: NumbersOnly = NumbersOnly()
    @State private var noteField: String = ""
    @State private var walletField: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                
                Spacer()
                
                CurrencyTextfield(value: $amountField.value)
                
                TextField("", text: $noteField, axis: .vertical)
                    .autocapitalization(.none)
                    .modifier(TextfieldModifier(
                        label: "Note", placeholder: "A note here", text: noteField))
                
                Spacer()
                
                Button {
                    print("Clicked")
                } label: {
                    Text("Create Transaction")
                        .modifier(PrimaryButtonModifier())
                }
                
                Spacer()

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
                .environmentObject(ViewModel())
        }
    }
}
