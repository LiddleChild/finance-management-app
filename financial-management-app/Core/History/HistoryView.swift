//
//  HistoryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    @StateObject private var historyViewModel = HistoryViewModel()
    
    var body: some View {
        ContentTemplate  {
            HeaderView(header: "History")
            
            MonthYearPicker(value: $historyViewModel.monthYearField)
                .zIndex(1)
                .padding(.bottom, 8)
            
            Group {
                if historyViewModel.transaction.getDayTransaction().count > 0 {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(historyViewModel.transaction.getDayTransaction(),
                                    id: \.DayTransactionId) { i in
                                DayView(dayTransaction: i)
                            }
                        }
                    }
                } else {
                    Text("No activity found on this month.")
                        .foregroundColor(Color("color-5"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .toolbarBackground(Color("color-1"), for: .navigationBar)
    }
}

struct HistoryView_Previews: PreviewProvider {
    @StateObject static var viewModel = MainViewModel()
    static var previews: some View {
        NavigationStack {
            HistoryView()
                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(viewModel)
    }
}
