//
//  AddTransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @ObservedObject private var addTxnViewModel: AddTransactionViewModel = AddTransactionViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                
                Spacer()
                
                VStack(spacing: 32) {
                    CurrencyTextfield(value: $addTxnViewModel.amountField.value)
                    
                    HStack {
                        DropdownMenu(selection: $addTxnViewModel.walletField,
                                     placeholder: "Wallet",
                                     options: viewModel.getWalletDropdownOptions()
                        )
                        
                        DropdownMenu(selection: $addTxnViewModel.categoryField,
                                     placeholder: "Category",
                                     options: viewModel.getCategoryDropdownOptions()
                        )
                    }
                    .zIndex(1)
                    
                    TextField("", text: $addTxnViewModel.noteField, axis: .vertical)
                        .autocapitalization(.none)
                        .modifier(TextfieldModifier(
                            label: "Note",
                            placeholder: "A note here",
                            text: addTxnViewModel.noteField))
                }
                
                Spacer()
                
                Button {
                    addTxnViewModel.createTxn()
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
