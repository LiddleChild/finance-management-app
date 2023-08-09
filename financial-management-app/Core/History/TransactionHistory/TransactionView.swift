//
//  TransactionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct TransactionView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    
    var transaction: TransactionModel
    
    var body: some View {
        NavigationLink {
            TransactionHistoryView(transaction: transaction)
                .modifier(NagivationDismissModier())
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color("color-2"))
                    .frame(height: 56)
                
                HStack(spacing: 16) {
                    Text("\(viewModel.category.getCategoryLabelById(id: transaction.Category))")
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("\(viewModel.wallet.getWalletLabelById(id: transaction.Wallet))")
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(hex: viewModel.wallet.getWalletColorById(id: transaction.Wallet)))
                        }
                    
                    Spacer()
                    
                    Text(String(format: "%.2f THB", transaction.Amount))
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(transaction.Amount > 0 ? Color("color-green") : Color("color-red"))
                }
                .foregroundColor(Color("color-5"))
                .padding(.horizontal, 16)
            }
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()

                TransactionView(transaction: TransactionModel.DUMMY_EMPTY_NOTE)
                    .padding(.horizontal, 24)
            }
        }
        .environmentObject(MainViewModel())
    }
}
