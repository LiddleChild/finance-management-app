//
//  TransactionHistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import SwiftUI

private struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Transaction History")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("color-5"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TransactionHistoryView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            
            VStack(alignment: .center) {
                HeadingView()
                    .padding(.bottom, 48)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView()
    }
}
