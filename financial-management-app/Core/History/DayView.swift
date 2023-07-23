//
//  DayView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct DayView: View {
    var dayTransaction: DayTxnModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("color-5"))
                
                Text(Date(timeIntervalSince1970: Double(dayTransaction.Timestamp))
                    .formatted(.dateTime.day().month().year())
                )
                .padding(.horizontal, 8)
                .foregroundColor(Color("color-5"))
                .background(Color("color-1"))
                .padding(.leading, 24)
            }
            
            VStack(spacing: 4) {
                ForEach(dayTransaction.Transactions, id: \.TransactionId) { i in
                    TransactionView(transaction: i)
                }
            }
        }
    }
}


struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                DayView(dayTransaction: DayTxnModel.DUMMY)
                    .padding(.horizontal, 24)
            }
        }
        .environmentObject(ViewModel())
    }
}
