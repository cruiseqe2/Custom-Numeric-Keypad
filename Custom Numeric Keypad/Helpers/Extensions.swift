//
//  Extensions.swift
//  NumericKeypadTest
//
//  Created by Mark Oelbaum on 02/09/2024.
//

import SwiftUI

extension View {
    
    /// https://gist.github.com/paescebu/f5ab50615b52f52f34bf2eff6185b54a
    func syncFocusStates<Value: Equatable>(focusState: FocusState<Value>.Binding, with: Binding<Value>) -> some View {
        self
            .onChange(of: with.wrappedValue) { _, newValue in
                focusState.wrappedValue = newValue
            }
            .onChange(of: focusState.wrappedValue) { _, newValue in
                with.wrappedValue = newValue
            }
    }
}

