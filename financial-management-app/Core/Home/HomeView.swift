//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 48) {
                    HeaderView(header: "Hello,", subheader: "Gaben Newell")
                    
                    QuickSummaryView(path: $path)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                Button {
                    path.append(NavigationViews.ADD_TRANSACTION_VIEW)
                } label: {
                    Text("+")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundColor(Color("color-5"))
                        .padding(24)
                        .background(Circle().foregroundColor(Color("color-4")))
                }
                .padding(28)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar(.visible)
            .navigationDestination(for: NavigationViews.self) { path in
                switch path {
                case NavigationViews.HISTORY_VIEW:
                    HistoryView()
                        .modifier(NagivationDismissModier())
                    
                case NavigationViews.ADD_TRANSACTION_VIEW:
                    AddTransactionView(path: $path)
                        .modifier(NagivationDismissModier())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HomeView()
                .environmentObject(ViewModel())
                .environmentObject(ModalViewModel.shared)
            
            Modal()
        }
    }
}
