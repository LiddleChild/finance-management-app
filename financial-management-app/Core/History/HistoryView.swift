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
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color("color-2"))
                .frame(height: 56)
            
            HStack {
                Text("Transfer")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("color-5"))
                
                Spacer()
                
                Text("+10,000 THB")
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: 0x00FF77))
            }
            .padding(.horizontal, 12)
        }
    }
}

private struct DayView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("color-5"))
                
                Text("18 Jun 2023")
                    .padding(.horizontal, 8)
                    .foregroundColor(Color("color-5"))
                    .background(Color("color-1"))
                    .padding(.leading, 24)
            }
            
            VStack(spacing: 4) {
                ForEach((0...2), id: \.self) { i in
                    TransactionView()
                }
            }
        }
    }
}

struct HistoryView: View {
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
                        ForEach((0...2), id: \.self) { i in
                            DayView()
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
