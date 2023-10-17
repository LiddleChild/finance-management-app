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
    
    @StateObject private var addTxnViewModel = AddTransactionViewModel.shared
    
    var body: some View {
        ContentTemplate {
            VStack {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                
                VStack(spacing: 24) {
                    CurrencyTextfield(value: $addTxnViewModel.amountField.value)
                        .modifier(HideKeyboard())
                    
                    ToggleButton(states: addTxnViewModel.expenseState,
                                 value: $addTxnViewModel.expenseField)
                    
                    DropdownMenu(selection: $addTxnViewModel.walletField,
                                 placeholder: "Wallet",
                                 options: viewModel.wallet.getWalletDropdownOptions())
                }
                
                Spacer()
                
                Button {
                    navigationCenter.goto(ViewLists.ADD_DETAIL_VIEW)
                } label: {
                    Text("Next")
                        .modifier(PrimaryButtonModifier())
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NavigationStack {
        AddTransactionView()
            .toolbar(.visible)
            .environmentObject(MainViewModel())
            .environmentObject(ModalViewModel.shared)
            .environmentObject(NavigationCenter.shared)
    }
    .overlay {
        Modal()
    }
}
