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
        VStack(spacing: 4) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.color5)
                
                Text(Date(timeIntervalSince1970: Double(dayTransaction.Timestamp))
                    .formatted(.dateTime.day().month().year())
                )
                .padding(.horizontal, 8)
                .foregroundColor(Color.color5)
                .background(Color.color1)
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
            ContentTemplate {
                DayView(dayTransaction: DayTxnModel.DUMMY)
            }
        }
        .environmentObject(MainViewModel())
    }
}
