//
//  CategorySettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

import SwiftUI

struct CategorySettingView: View {
    @EnvironmentObject private var contentViewModel: ContentViewModel
    
    var body: some View {
        SettingList {
            ForEach(contentViewModel.category.getCategory(),
                    id: \.CategoryId) { category in
                SettingNavigationLink(label: category.Label) {
                    CategoryEditorView(category: category)
                }
            }
        }
        .onAppear {
            contentViewModel.fetchCategory()
        }
        
        NavigationLink {
            WalletCreatingView()
        } label: {
            Text("+ Category").foregroundColor(Color.gray)
        }
        .padding(8)
    }
}

struct CategorySettingView_Previews: PreviewProvider {
    @StateObject static var viewModel = ContentViewModel()
    static var previews: some View {
        NavigationStack {
            ContentTemplate {
                CategorySettingView()
                    .environmentObject(viewModel)
            }
        }
    }
}
