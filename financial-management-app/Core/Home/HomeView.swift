//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

private struct QuickSummaryView: View {
    let data = [
        (0.45, Color(hex: 0x128000)),
        (1.0, Color(hex: 0x900000)),
    ]
    
    var body: some View {
        ZStack {
            PieChartView(data: data)
            
            NavigationLink {
                HistoryView()
                    .modifier(NagivationDismissModier())
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("12,345.67")
                            .font(.system(size: 24, weight: .regular))
                    }
                }
            }
            .accentColor(Color("color-5"))
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HeaderView(header: "Hello,", subheader: "Gaben Newell")
                        .padding(.bottom, 48)
                    
                    QuickSummaryView()
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
            .toolbar(.visible)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
