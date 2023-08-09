//
//  AddTransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @EnvironmentObject private var navigationCenter: NavigationCenter
    @EnvironmentObject private var viewModel: MainViewModel
    @StateObject private var addTxnViewModel = AddTransactionViewModel()
    
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
                                     options: viewModel.wallet.getWalletDropdownOptions())
                        
                        ToggleButton(states: addTxnViewModel.expenseState,
                                     value: $addTxnViewModel.expenseField)
                    }.zIndex(2)
                    
                    Group {
                        if addTxnViewModel.expenseField {
                            DropdownMenu(
                                selection: $addTxnViewModel.categoryField,
                                placeholder: "Category",
                                options: viewModel.category.getExpenseCategoryDropdownOptions())
                        } else {
                            DropdownMenu(
                                selection: $addTxnViewModel.categoryField,
                                placeholder: "Category",
                                options: viewModel.category.getIncomeCategoryDropdownOptions())
                        }
                    }
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
                            navigationCenter.backHome()
                        }
                    } onFailure: { error in
                        modalViewModel.alertFailure(
                            message: "Fail to create Transaction!") {
                                navigationCenter.backHome()
                        }
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
    var body: some View {
        ZStack {
            NavigationStack {
                AddTransactionView()
                    .toolbar(.visible)
                    .environmentObject(MainViewModel())
                    .environmentObject(ModalViewModel.shared)
                    .environmentObject(NavigationCenter.shared)
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
