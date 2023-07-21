//
//  DropdownList.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownList: View {
    @State private var contentSize: CGSize = .zero
    
    var options: [DropdownOption]
    var onSelectingOption: (_ option: DropdownOption) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(options, id: \.OptionId) { option in
                    DropdownListButton(
                        option: option, onSelectingOption: onSelectingOption)
                }
                
            }
            .padding(8)
            .background {
                GeometryReader { geo in
                    Color.clear.onAppear {
                        contentSize = geo.size
                    }
                }
            }
            
        }
        .frame(height: min(contentSize.height, 132))
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color("color-2"))
        }
    }
}

private struct Preview: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            DropdownList(options: DropdownOption.DUMMY) { _ in }
        }
    }
}

struct DropdownList_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
