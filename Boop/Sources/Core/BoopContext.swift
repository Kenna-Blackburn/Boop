//
//  BoopContext.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import SwiftUI

@Observable
final class BoopContext {
    var text: String = ""
    var receipt: String = ""
    
    var scripts: [BoopScript] = []
    var scriptHistory: [BoopScript] = []
    
    init() {
        indexScripts()
    }
}

extension BoopContext {
    func print(_ value: String) {
        receipt.append(value)
        receipt.append("\n")
    }
}

extension BoopContext {
    var lastUsedScript: BoopScript? {
        scriptHistory.last
    }
    
    func indexScripts() {
        scripts = BoopScripts.allTypes.flatMap({ $0.makeInstances() })
    }
    
    func useScript<S: BoopScript>(_ script: S) {
        if !receipt.isEmpty {
            print("---")
        }
        
        print("Running '\(script.descriptor.title)'")
        script.execute(in: self)
        scriptHistory.append(script)
    }
}
