//
//  CategorySettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

import SwiftUI

struct CategorySettingView: View {
    @EnvironmentObject private var contentViewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            SettingList(title: "Income") {
                
                if (contentViewModel.category.getIncomeCategory().isEmpty) {
                    Text("No income category found.")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16))
                        .foregroundColor(Color.color5)
                } else {
                    ForEach(contentViewModel.category.getIncomeCategory(),
                            id: \.CategoryId) { category in
                        SettingNavigationLink(label: category.Label) {
                            CategoryEditorView(category: category)
                        }
                    }
                }
            }
            
            NavigationLink {
                CategoryCreatingView(categoryType: "INCOME")
            } label: {
                Text("+ Income Category")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 16))
            }
            .padding(.top, 8)
            
            SettingList(title: "Expense") {
                
                if (contentViewModel.category.getExpenseCategory().isEmpty) {
                    Text("No expense category found.")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16))
                        .foregroundColor(Color.color5)
                } else {
                    ForEach(contentViewModel.category.getExpenseCategory(),
                            id: \.CategoryId) { category in
                        SettingNavigationLink(label: category.Label) {
                            CategoryEditorView(category: category)
                        }
                    }
                }
            }
            
            NavigationLink {
                CategoryCreatingView(categoryType: "EXPENSE")
            } label: {
                Text("+ Expense Category")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 16))
            }
            .padding(8)
        }
        .onAppear {
            contentViewModel.fetchCategory()
        }
    }
}

struct CategorySettingView_Previews: PreviewProvider {
    @StateObject static var viewModel = MainViewModel()
    static var previews: some View {
        NavigationStack {
            ContentTemplate {
                CategorySettingView()
                    .environmentObject(viewModel)
            }
        }
    }
}
