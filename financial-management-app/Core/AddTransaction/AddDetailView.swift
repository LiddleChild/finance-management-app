//
//  AddDetailView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 17/10/2566 BE.
//

import SwiftUI

struct AddDetailView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @EnvironmentObject private var navigationCenter: NavigationCenter
    @EnvironmentObject private var viewModel: MainViewModel
    
    @State var addTxnViewModel: AddTransactionViewModel;
    
    var body: some View {
        ContentTemplate {
            VStack {
                HeaderView(header: "Add your Transaction", subheader: "Please fill your transaction information")
                    .padding(.bottom, 48)
                
                VStack(spacing: 24) {
                    TextField("", text: $addTxnViewModel.noteField)
                        .autocapitalization(.none)
                        .modifier(TextfieldModifier(
                            label: "Note",
                            placeholder: "A note here",
                            text: addTxnViewModel.noteField))
                    
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
            }
        }
    }
}

private struct Preview: View {
    @StateObject private var addTxnViewModel = AddTransactionViewModel()
    
    var body: some View {
        AddDetailView(addTxnViewModel: addTxnViewModel)
    }
}

#Preview {
    ZStack {
        NavigationStack {
            Preview()
                .toolbar(.visible)
                .environmentObject(MainViewModel())
                .environmentObject(ModalViewModel.shared)
                .environmentObject(NavigationCenter.shared)
        }
        
        Modal()
    }
}
