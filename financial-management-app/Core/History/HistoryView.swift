//
//  HistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var viewModel: ContentViewModel
    @StateObject private var historyViewModel = HistoryViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HeaderView(header: "History")
                    .padding(.horizontal, 24)
                
                MonthYearPicker(value: $historyViewModel.monthYearField)
                
                ScrollView {
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
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    @StateObject static var viewModel = ContentViewModel()
    static var previews: some View {
        NavigationStack {
            HistoryView()
                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(viewModel)
    }
}
