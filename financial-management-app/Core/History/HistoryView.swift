//
//  HistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @StateObject private var historyViewModel = HistoryViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center) {
                    HeaderView(header: "History")
                        .padding(.bottom, 48)
                    
                    VStack(spacing: 16) {
                        ForEach(historyViewModel.transaction.getDayTransaction(),
                                id: \.DayTransactionId) { i in
                            DayView(dayTransaction: i)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .toolbarBackground(Color("color-1"), for: .navigationBar)
    }
}

struct HistoryView_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()
    static var previews: some View {
        NavigationStack {
            HistoryView()
                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(viewModel)
    }
}
