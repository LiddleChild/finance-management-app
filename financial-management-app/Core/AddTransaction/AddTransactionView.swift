//
//  AddTransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @EnvironmentObject private var viewModel: ViewModel
    @ObservedObject private var addTxnViewModel = AddTransactionViewModel()
    
    @Binding var path: [NavigationViews]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                    .lineLimit(2)
                
                Spacer()
                
                VStack(spacing: 24) {
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
                    
                    TextField("", text: $addTxnViewModel.noteField)
                        .autocapitalization(.none)
                        .modifier(TextfieldModifier(
                            label: "Note",
                            placeholder: "A note here",
                            text: addTxnViewModel.noteField))
                }
                
                Spacer()
                
                Button {
                    addTxnViewModel.createTxn {
                        modalViewModel.alertSuccess() {
                            path = []
                            viewModel.fetchData()
                        }
                    } onFailure: { error in
                        modalViewModel.alertFailure(message: "Fail to create Transaction!")
                    }
                } label: {
                    Text("Create Transaction")
                        .modifier(PrimaryButtonModifier())
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

private struct Preview: View {
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        ZStack {
            NavigationStack {
                AddTransactionView(path: $path)
                    .toolbar(.visible)
                    .environmentObject(ViewModel())
                    .environmentObject(ModalViewModel.shared)
            }
            
            Modal()
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
