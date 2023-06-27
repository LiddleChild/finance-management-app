//
//  HistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

private struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("History")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("color-5"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct TransactionView: View {
    var transaction: TransactionModel
    
    var body: some View {
        NavigationLink {
            TransactionHistoryView()
                .modifier(NagivationDismissModier())
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color("color-2"))
                    .frame(height: 56)
                
                HStack {
                    Text("\(transaction.category)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("color-5"))
                    
                    Spacer()
                    
                    Text(String(format: "%.2f THB", transaction.amount))
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color(hex: transaction.amount > 0 ? 0x00FF77 : 0xDB4325))
                }
                .padding(.horizontal, 12)
            }
        }
    }
}

private struct DayView: View {
    var dayTransaction: DayTransactionModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("color-5"))
                
                Text(Date(timeIntervalSince1970:Double(dayTransaction.timestamp))
                    .formatted(.dateTime.day().month().year())
                )
                .padding(.horizontal, 8)
                .foregroundColor(Color("color-5"))
                .background(Color("color-1"))
                .padding(.leading, 24)
            }
            
            VStack(spacing: 4) {
                ForEach(dayTransaction.transactions, id: \.transactionId) { i in
                    TransactionView(transaction: i)
                }
            }
        }
    }
}

struct HistoryView: View {
    let dummy: [DayTransactionModel] = [
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
        .init(id: "1", timestamp: 1687737600, transactions: [
            .init(transactionId: "1", category: "Transfer",
                  wallet: "kbank", amount: 12345.67, note: ""),
            .init(transactionId: "2", category: "Transfer",
                  wallet: "scb", amount: -12345.67, note: ""),
        ]),
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center) {
                    HeadingView()
                        .padding(.bottom, 48)
                    
                    VStack(spacing: 16) {
                        ForEach(dummy, id: \.id) { i in
                            DayView(dayTransaction: i)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
