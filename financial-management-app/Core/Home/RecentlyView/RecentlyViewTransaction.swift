//
//  RecentlyViewTransaction.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct RecentlyViewTransaction: View {
    @EnvironmentObject private var viewModel: MainViewModel
    
    var transaction: TransactionModel
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(viewModel.category.getCategoryLabelById(id: transaction.Category))")
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            Text(String(format: "%.2f THB", transaction.Amount))
                .multilineTextAlignment(.trailing)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(transaction.Amount > 0 ? Color("color-green") : Color("color-red"))
        }
        .foregroundColor(Color("color-5"))
    }
}

struct RecentlyViewTransaction_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            RecentlyViewTransaction(transaction: TransactionModel.DUMMY_EMPTY_NOTE)
                .padding(.horizontal, 24)
                .environmentObject(ContentViewModel())
        }
    }
}
