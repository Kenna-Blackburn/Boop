//
//  BoopScriptDescriptor.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import Foundation

struct BoopScriptDescriptor {
    let title: String
    let systemImage: String
    let description: String
    let searchKeywords: [String]
    
    init(
        title: String,
        systemImage: String,
        description: String,
        searchKeywords: [String] = [],
    ) {
        self.title = title
        self.systemImage = systemImage
        self.description = description
        self.searchKeywords = searchKeywords
    }
}
