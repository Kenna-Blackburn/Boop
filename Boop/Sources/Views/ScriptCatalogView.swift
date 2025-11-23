//
//  ScriptCatalogView.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import SwiftUI

struct ScriptCatalogView: View {
    
    @Binding var context: BoopContext
    
    init(for context: Binding<BoopContext>) {
        self._context = context
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var searchText: String = ""
    
    var filteredScripts: [BoopScript] {
        return context.scripts
            .filter {
                searchText.isEmpty ||
                $0.descriptor.title.localizedCaseInsensitiveContains(searchText) ||
                $0.descriptor.searchKeywords.contains {
                    $0.localizedCaseInsensitiveContains(searchText)
                }
            }
            .sorted(using: SortDescriptor(\.descriptor.title))
    }
    
    var body: some View {
        NavigationStack {
            List {
                if searchText.isEmpty, !context.scriptHistory.isEmpty {
                    Section("Recents") {
                        scripts(context.scriptHistory.suffix(10))
                    }
                }
                
                Section {
                    scripts(filteredScripts)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Script Catalog")
            .toolbar {
                Button(
                    role: .close,
                    action: dismiss.callAsFunction,
                )
            }
        }
    }
}

extension ScriptCatalogView {
    @ViewBuilder
    private func scriptRow(
        for script: BoopScript
    ) -> some View {
        Button {
            context.useScript(script)
            dismiss()
        } label: {
            Label {
                VStack(alignment: .leading) {
                    Text(script.descriptor.title)
        
                    Text(script.descriptor.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: script.descriptor.systemImage)
            }
        }
        .foregroundStyle(.primary)
    }
    
    @ViewBuilder
    private func scripts(
        _ scripts: [BoopScript]
    ) -> some View {
        ForEach(
            scripts.indices,
            id: \.self,
            content: { scriptRow(for: scripts[$0]) }
        )
    }
}
