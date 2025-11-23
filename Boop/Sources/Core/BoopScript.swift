//
//  BoopScript.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import Foundation

protocol BoopScript {
    typealias Descriptor = BoopScriptDescriptor
    
    static func makeInstances() -> [Self]
    
    var descriptor: Descriptor { get }
    
    func execute(in context: BoopContext)
}
