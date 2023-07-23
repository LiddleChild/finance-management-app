//
//  QuickSummary.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct QuickSummaryView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var path: [NavigationViews]
    
    var body: some View {
        ZStack {
            PieChartView(data: viewModel.getQuickSummary())
            
            Button {
                path.append(NavigationViews.HISTORY_VIEW)
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .foregroundColor(.clear)
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("Monthly expense")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color("color-5"))
                        
                        Text(String(format: "%.2f", viewModel.getQuickSummaryAmount()))
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(Color("color-5"))
                    }
                }
            }
        }
    }
}


private struct Preview: View {
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            QuickSummaryView(path: $path)
                .environmentObject(ViewModel())
                .environmentObject(ModalViewModel.shared)
        }
    }
}

struct QuickSummary_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
