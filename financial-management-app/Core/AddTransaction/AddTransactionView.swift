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
    
    @Binding var path: [NavigationViews]
    
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
                                     options: viewModel.getWalletDropdownOptions())
                        
                        ToggleButton(states: addTxnViewModel.expenseState,
                                     value: $addTxnViewModel.expenseField)
                    }.zIndex(2)
                    
                    DropdownMenu(selection: $addTxnViewModel.categoryField,
                                 placeholder: "Category",
                                 options: viewModel.getCategoryDropdownOptions())
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
                    path = []
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

private struct Preview: View {
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        NavigationStack {
            AddTransactionView(path: $path)
                .toolbar(.visible)
                .environmentObject(ViewModel())
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
