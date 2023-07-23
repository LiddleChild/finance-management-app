//
//  ToggleButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct ToggleButton: View {
    var firstState: ToggleButtonState
    var secondState: ToggleButtonState
    
    @Binding var value: Bool
    
    var body: some View {
        Button {
            withAnimation {
                value.toggle()
            }
        } label: {
            HStack {
                if !value {
                    Text(verbatim: firstState.Label)
                        .foregroundColor(firstState.ActiveColor ?? Color("color-4"))
                        .fontWeight(.bold)
                } else {
                    Text(verbatim: firstState.Label)
                        .foregroundColor(Color("color-2"))
                        .fontWeight(.regular)
                }
                
                Spacer()
                
                if value {
                    Text(verbatim: secondState.Label)
                        .foregroundColor(secondState.ActiveColor ?? Color("color-4"))
                        .fontWeight(.bold)
                } else {
                    Text(verbatim: secondState.Label)
                        .foregroundColor(Color("color-2"))
                        .fontWeight(.regular)
                }
            }
            .foregroundColor(Color("color-5"))
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("color-5"))
            }
        }
    }
}

private struct Preview: View {
    @State var state: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            ToggleButton(firstState: ToggleButtonState.DUMMY_GREEN,
                         secondState: ToggleButtonState.DUMMY_RED,
                         value: $state)
            .padding(.horizontal, 24)
        }
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
