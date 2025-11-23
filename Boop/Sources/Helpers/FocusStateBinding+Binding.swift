//
//  FocusStateBinding+Binding.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import SwiftUI

extension FocusState.Binding {
    var binding: Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}
