//
//  ViewModel.swift
//  NumericKeypadTest
//
//  Created by Mark Oelbaum on 30/08/2024.
//

import Foundation
import SwiftUI

@Observable
class ViewModel {
    var textField1: String = ""
    var textField2: String = ""
    var placeholder1: String = "Field1"
    var placeholder2: String = "Field2"
    
    var fieldInFocus: FieldInFocus?
    
    /// Keyboard Button View
    @ViewBuilder
    func KeyboardButtonView(_ value: KeyboardButtonType, color: Color = .white, onTap: @escaping () -> ()) -> some View {
        Button(action: onTap) {
            ZStack {
                switch value {
                case .text(let string):
                    Text(string)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                case .image(let image):
                    Image(systemName: image)
                        .font(color == .white ? .title2 : .title)
                        .fontWeight(.semibold)
                        .foregroundStyle(color)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .contentShape(Rectangle())
        }
    }
}
