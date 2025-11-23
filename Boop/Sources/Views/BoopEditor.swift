//
//  BoopEditor.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import SwiftUI

struct BoopEditor: View {
    
    @Binding var context: BoopContext
    
    init(for context: Binding<BoopContext>) {
        self._context = context
    }
    
    @FocusState private var isEditorFocused: Bool
    
    @State private var isReceiptPresented: Bool = false
    @State private var isScriptCatalogPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $context.text)
                .monospaced()
                .contentMargins(15)
                .focused($isEditorFocused)
                .sheet(
                    isPresented: $isReceiptPresented,
                    content: { receiptView },
                )
                .sheet(
                    isPresented: $isScriptCatalogPresented,
                    content: { ScriptCatalogView(for: $context) },
                )
                .navigationTitle("Boop for iOS")
                .toolbar(content: { toolbar })
                .toolbarRole(.editor)
        }
    }
}



extension BoopEditor {
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        let placement: ToolbarItemPlacement = isEditorFocused ? .keyboard : .bottomBar
        
        ToolbarSpacer(.flexible, placement: placement)
        
        ToolbarItem(placement: placement) {
            Toggle(
                "Receipt",
                systemImage: "scroll",
                isOn: $isReceiptPresented,
            )
            .disabled(context.receipt.isEmpty)
        }
        
        ToolbarItem(placement: placement) {
            Toggle(
                "Script Catalog",
                systemImage: "command",
                isOn: $isScriptCatalogPresented,
            )
        }
        
        ToolbarSpacer(.fixed, placement: placement)
        
        ToolbarItem(placement: placement) {
            Toggle(
                "Keyboard",
                systemImage: "keyboard.badge.eye",
                isOn: $isEditorFocused.binding,
            )
        }
    }
}

extension BoopEditor {
    @ViewBuilder
    private var receiptView: some View {
        NavigationStack {
            TextEditor(text: $context.receipt)
                .monospaced()
                .contentMargins(15)
                .navigationTitle("Receipt")
                .toolbar {
                    Button(
                        role: .close,
                        action: { isReceiptPresented = false },
                    )
                }
        }
    }
}
