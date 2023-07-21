//
//  DropdownListButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownListButton: View {
    var option: DropdownOption
    var onSelectingOption: (_ option: DropdownOption) -> Void
    
    var body: some View {
        Button {
            onSelectingOption(option)
        } label: {
            HStack {
                Circle()
                    .strokeBorder(Color("color-5"), lineWidth: 1)
                    .background(Circle().foregroundColor(option.Color))
                    .scaledToFit()
                
                Text(option.Label)
                    .font(.system(size: 20))
                    .foregroundColor(Color("color-5"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(4)
            .frame(height: 28)
        }
    }
}

struct DropdownListButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            DropdownListButton(option: DropdownOption.DUMMY[0]) { _ in }
                .background {
                    Rectangle()
                        .stroke(.white)
                }
        }
    }
}
