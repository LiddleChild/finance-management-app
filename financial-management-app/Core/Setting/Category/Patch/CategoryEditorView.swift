//
//  CategoryEditorView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

private enum FocusedField {
    case Label, Color
}

struct CategoryEditorView: View {
    @EnvironmentObject private var modalvm: ModalViewModel
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = CategoryEditorViewModel()
    @FocusState private var focusField: FocusedField?
    
    var category: CategoryModel
    
    var body: some View {
        VStack(spacing: 16) {
            SettingList {
                SettingTextField(text: $vm.labelField, placeholder: category.Label)
                    .focused($focusField, equals: .Label)
                    .autocapitalization(.none)
                    .modifier(HideKeyboard())
                
                ColorPicker(
                    "Color",
                    selection: $vm.colorField,
                    supportsOpacity: false)
                .focused($focusField, equals: .Color)
            }
            .font(.system(size: 20))
            .onAppear {
                vm.colorField = Color(hex: category.Color)
                focusField = FocusedField.Label
            }
            
            Button {
                focusField = nil
                vm.patch(category) {
                    modalvm.alertSuccess() { dismiss() }
                } onFailure: { err in
                    modalvm.alertFailure(
                        message: "Fail to update Wallet!") { dismiss() }
                }
            } label: {
                Text("Save")
                    .foregroundColor(Color.color5)
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(vm.doesChange(category) ? Color.color4 : Color.gray))
            .disabled(!vm.doesChange(category))
            
            Spacer()
            
            Button {
                focusField = nil
                modalvm.yesNoQuestion(
                    title: "Confirm?",
                    message: "You are about to delete \(category.Label)") { value in
                        if value {
                            vm.delete(category) {
                                modalvm.alertSuccess() { dismiss() }
                            } onFailure: { err in
                                modalvm.alertFailure(
                                    message: "Fail to delete Wallet!") { dismiss() }
                            }
                        }
                    }
            } label: {
                Text("Delete")
                    .padding(8)
                    .foregroundColor(Color.red)
                    .frame(maxWidth: .infinity)
            }
            .background(RoundedRectangle(cornerRadius: 12).stroke(.red, lineWidth: 1))
        }
    }
}

struct CategoryEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTemplate {
            CategoryEditorView(category: CategoryModel(
                CategoryId: "",
                Color: 0xFFFF00,
                Label: "",
                Type: "EXPENSE"))
        }
    }
}
