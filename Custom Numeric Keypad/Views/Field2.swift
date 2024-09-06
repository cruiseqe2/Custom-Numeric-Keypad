//
//  Field2.swift
//  Custom Numeric Keypad
//
//  Created by Mark Oelbaum on 30/08/2024.
//

import SwiftUI

struct Field2: View {
    
    @Environment(ViewModel.self) var vm
    @FocusState var fieldInFocus: FieldInFocus?
    @Binding var field: String
    
    var body: some View {
        @Bindable var vm = vm
        TextField(vm.placeholder2, text: $vm.textField2)
            .inputView(vm.placeholder2) {
                CustomNumericKeypad(showDecimal: false)
            }
            .focused($fieldInFocus, equals: .field2)
            .syncFocusStates(focusState: $fieldInFocus, with: $vm.fieldInFocus)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .environment(\.colorScheme, .dark)
            .padding([.horizontal, .top], 30)
    }
    
    /// Custom Keyboard
    /// https://www.youtube.com/watch?v=jNpdpO32Pjs&t=616s
    @ViewBuilder
    func CustomNumericKeypad(showDecimal: Bool = false) -> some View {
        LazyVGrid(
            columns: Array(repeating: .init(.flexible(), spacing: 10),
                           count: 3), spacing: 10)
        {
            ForEach(1...9, id: \.self) { index in
                vm.KeyboardButtonView(.text("\(index)")) {
                    /// Adding Text
                    field.append("\(index)")
                }
            }
            /// Other Buttons
            vm.KeyboardButtonView(.image("xmark.circle"), color: .red) {
                field = ""
            }
            vm.KeyboardButtonView(.text("0")) {
                field.append("0")
            }
            vm.KeyboardButtonView(.image("delete.backward"), color: .indigo) {
                /// Removing Text One by One
                if !field.isEmpty {
                    field.removeLast()
                }
            }
            if showDecimal {
                vm.KeyboardButtonView(.text(".")) {
                    field.append(".")
                }
            } else {
                vm.KeyboardButtonView(.text("")) {}
            }
            vm.KeyboardButtonView(.text("00")) {
                field.append("00")
            }
            vm.KeyboardButtonView(.image("checkmark.circle.fill"), color: .green) {
                /// Closing Keyboard
                fieldInFocus = nil
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background {
            Rectangle()
                .fill(Color("BG").gradient)
                .ignoresSafeArea()
        }
    }
    
}
