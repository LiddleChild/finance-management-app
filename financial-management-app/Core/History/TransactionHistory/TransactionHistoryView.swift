//
//  TransactionHistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import SwiftUI

private struct DescriptionView: View {
    var key: String
    var value: String
    var color: Color = Color("color-5")
    
    var body: some View {
        HStack(spacing: 16) {
            Text(key)
                .foregroundColor(Color("color-5"))
                .font(.system(size: 20, weight: .medium))
                .frame(maxWidth: 96, alignment: .trailing)
            
            Text(value)
                .foregroundColor(color)
                .font(.system(size: 20, weight: .light))
        }
    }
}

struct TransactionHistoryView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    
    var transaction: TransactionModel
    @State private var noteField: String = ""
    
    var body: some View {
        ContentTemplate {
            VStack(alignment: .leading, spacing: 48) {
                HeaderView(header: "Transaction History")
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(Date(timeIntervalSince1970: Double(transaction.Timestamp))
                        .formatted(.dateTime.day().month().year()))
                    .foregroundColor(Color("color-5"))
                    .font(.system(size: 28, weight: .regular))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        DescriptionView(
                            key: "Category",
                            value: viewModel.category.getCategoryLabelById(id: transaction.Category))
                        
                        DescriptionView(
                            key: "Wallet",
                            value: viewModel.wallet.getWalletLabelById(id: transaction.Wallet))
                        
                        DescriptionView(
                            key: "Amount",
                            value: String(format: "%.2f THB", transaction.Amount),
                            color: transaction.Amount > 0 ? Color("color-green") : Color("color-red"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("", text: $noteField)
                        .modifier(TextfieldModifier(
                            label: "Note",
                            placeholder: noteField,
                            text: noteField))
                        .disabled(true)
                        .onAppear {
                            noteField = transaction.Note == "" ?
                            "No note written." : transaction.Note
                        }
                }
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.color5)
                }
                
            }
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    @StateObject static var viewModel = MainViewModel()
    static var previews: some View {
        NavigationStack {
            TransactionHistoryView(transaction: TransactionModel.DUMMY_EMPTY_NOTE)
                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(viewModel)
    }
}
