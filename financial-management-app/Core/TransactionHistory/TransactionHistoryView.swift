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
    @EnvironmentObject private var viewModel: ViewModel
    
    var transaction: TxnModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
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
                            value: viewModel.getCategoryLabelById(id: transaction.Category))
                        
                        DescriptionView(
                            key: "Wallet",
                            value: viewModel.getWalletLabelById(id: transaction.Wallet))
                        
                        DescriptionView(
                            key: "Amount",
                            value: String(format: "%.2f THB", transaction.Amount),
                            color: transaction.Amount > 0 ? Color("color-green") : Color("color-red"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("Note")
                            .foregroundColor(Color("color-5"))
                            .font(.system(size: 20, weight: .medium))
                            .padding(.horizontal, 8)
                            .background(Color("color-1"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .zIndex(1)
                            .padding(.leading, 16)
                        
                        Text(transaction.Note == "" ?
                             "No note written." : transaction.Note)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("color-5"))
                        .font(.system(size: 16, weight: .light))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12).strokeBorder(Color("color-3")))
                        .offset(y: -24)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TransactionHistoryView(transaction: TxnModel.DUMMY_LONG_NOTE)
                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(ViewModel())
    }
}
