//
//  ContentView.swift
//  NumericKeypadTest
//
//  Created by Mark Oelbaum on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ViewModel.self) var vm
    
    var body: some View {
        @Bindable var vm = vm
        
        VStack {
            Image("Apple")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            Field1(field: $vm.textField1)
            Field2(field: $vm.textField2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(Color("BG").gradient)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
