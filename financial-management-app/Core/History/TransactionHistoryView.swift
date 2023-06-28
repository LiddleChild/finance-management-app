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
    
    var body: some View {
        HStack(spacing: 16) {
            Text(key)
                .foregroundColor(Color("color-5"))
                .font(.system(size: 20, weight: .medium))
                .frame(maxWidth: 96, alignment: .trailing)
            
            Text(value)
                .foregroundColor(Color("color-5"))
                .font(.system(size: 20, weight: .light))
        }
    }
}

struct TransactionHistoryView: View {
    var transaction: TxnModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HeaderView(header: "Transaction History")
                    .padding(.bottom, 48)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(Date(timeIntervalSince1970:Double(transaction.Timestamp))
                        .formatted(.dateTime.day().month().year())
                    )
                    .foregroundColor(Color("color-5"))
                    .font(.system(size: 28, weight: .regular))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        DescriptionView(key: "Category", value: transaction.Category)
                        DescriptionView(key: "Wallet", value: transaction.Wallet)
                        DescriptionView(key: "Amount", value: String(
                            format: "%.2f THB", transaction.Amount))
                        
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
                                 "No note written." : transaction.Note
                            )
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("color-5"))
                                .font(.system(size: 16, weight: .light))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color("color-3"))
                                )
                                .offset(y: -24)
                        }
                        
//                        Text(transaction.note)
//                            .font(.system(size: 16, weight: .regular))
//                            .padding()
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background {
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(Color("color-3"))
//                            }
//                            .padding(.top, 16)
//                            .overlay {
//                                Text("Note")
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                                    .offset(x: 12, y: -20)
//                            }
//                            .foregroundColor(Color("color-5"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
            TransactionHistoryView(
                transaction: .init(
                    TransactionId: "1",
                    Category: "Transfer",
                    Wallet: "kbank",
                    Amount: 12345.67,
//                    Note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum, neque vulputate dignissim maximus, lectus eros rutrum nunc, quis dignissim erat velit in ante. Nulla ac libero sed nulla egestas mattis. Fusce ac felis vitae tellus auctor porttitor. Aenean pretium dui sed ligula posuere aliquam. Duis in laoreet quam. Nunc vitae massa faucibus, hendrerit massa nec, dignissim velit. Donec semper leo nibh, sed congue nunc viverra eget. Nunc blandit urna nulla, nec venenatis sem facilisis et.",
                      Note: "",
                    Timestamp: 1687737600)
            )
            .toolbar(.visible, for: .navigationBar)
        }
    }
}
