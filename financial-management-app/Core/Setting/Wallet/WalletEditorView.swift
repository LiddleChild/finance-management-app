//
//  WalletEditorView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

private enum FocusedField {
    case Label, Color
}

struct WalletEditorView: View {
    var wallet: WalletModel
    
    @StateObject var vm = WalletEditorViewModel()
    @FocusState private var focusField: FocusedField?
    
    var body: some View {
        SettingList {
            SettingTextField(text: $vm.labelField, placeholder: wallet.Label)
                .focused($focusField, equals: .Label)
                .autocapitalization(.none)
            
            ColorPicker(
                "Color",
                selection: $vm.colorField,
                supportsOpacity: false)
            .focused($focusField, equals: .Color)
        }
        .font(.system(size: 20))
        .onAppear {
            vm.colorField = Color(hex: wallet.Color)
            focusField = FocusedField.Label
        }
        
        Button {
            
        } label: {
            Text("Save")
                .foregroundColor(Color.color5)
                .padding(8)
                .frame(maxWidth: .infinity)
        }
        .background(RoundedRectangle(cornerRadius: 12)
            .foregroundColor(vm.doesChange(wallet) ? Color.color4 : Color.gray))
        .padding(.top, 12)
        .disabled(!vm.doesChange(wallet))
    }
}

struct WalletEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTemplate {
            WalletEditorView(wallet: WalletModel(
                WalletId: "",
                Color: 0xFFFF00,
                Label: ""))
        }
    }
}
