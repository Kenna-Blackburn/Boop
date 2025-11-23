//
//  ContentView.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var context = BoopContext()
    
    var body: some View {
        BoopEditor(for: $context)
    }
}

#Preview {
    ContentView()
}
