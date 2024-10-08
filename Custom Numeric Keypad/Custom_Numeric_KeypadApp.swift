//
//  Custom_Numeric_KeypadApp.swift
//  Custom Numeric Keypad
//
//  Created by Mark Oelbaum on 06/09/2024.
//

import SwiftUI

@main
struct Custom_Numeric_KeypadApp: App {
    @State private var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
