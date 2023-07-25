//
//  RecentlyView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct RecentlyView: View {
    var transactions: [TxnModel]
    
    var body: some View {
        NavigationLink {
            HistoryView()
                .modifier(NagivationDismissModier())
        } label: {
            ZStack(alignment: .top) {
                Text("Recent Activities")
                    .foregroundColor(Color("color-5"))
                    .font(.system(size: 20, weight: .medium))
                    .padding(.horizontal, 8)
                    .background(Color("color-1"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(1)
                    .padding(.leading, 16)
                    .offset(y: -12)
                
                VStack(spacing: 8) {
                    if transactions.count > 0 {
                        ForEach(transactions, id: \.TransactionId) { transaction in
                            RecentlyViewTransaction(transaction: transaction)
                        }
                    } else {
                        Text("No recent activity found.")
                            .foregroundColor(Color("color-5"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 128, alignment: .topLeading)
                .foregroundColor(Color("color-5"))
                .font(.system(size: 16, weight: .light))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12).strokeBorder(Color("color-3")))
            }
        }
    }
}

struct RecentlyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
//                RecentlyView(transactions: TxnModel.DUMMYS)
                RecentlyView(transactions: [])
                    .padding(.horizontal, 24)
            }
        }
        .environmentObject(ViewModel())
    }
}
