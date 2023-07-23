//
//  DropdownMenu.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isShowingOption: Bool = false
    @Binding var selection: DropdownOption?
    
    var placeholder: String
    var options: [DropdownOption]
    
    var body: some View {
        Button {
            withAnimation {
                isShowingOption.toggle()
            }
        } label: {
            HStack {
                if let selection = selection {
                    DropdownListButton(option: selection) { _ in }
                    .disabled(true)
                } else {
                    Text("\(placeholder)").font(.system(size: 20))
                }
                
                Spacer()
                
                Image(systemName: isShowingOption ? "chevron.up" : "chevron.down")
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color(isShowingOption ? "color-4" : "color-2"))
            )
        }
        .overlay(alignment: .top) {
            if isShowingOption {
                DropdownList(options: options) { option in
                    isShowingOption = false
                    selection = option
                }
                .offset(y: 52)
            }
            
        }
        .foregroundColor(Color("color-5"))
    }
}

private struct Preview: View {
    @State private var selection: DropdownOption?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            DropdownMenu(selection: $selection,
                         placeholder: "Placeholder",
                         options: DropdownOption.DUMMY)
            .padding(24)
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
