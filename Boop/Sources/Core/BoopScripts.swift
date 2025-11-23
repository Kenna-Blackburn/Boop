//
//  BoopScript.swift
//  Boop
//
//  Created by Kenna Blackburn on 11/23/25.
//

import Foundation
import UIKit.UIPasteboard

enum BoopScripts {
    static let allTypes: [BoopScript.Type] = [
        Clear.self,
        ChangeCase.Lowercase.self,
        ChangeCase.Uppercase.self,
        Pasteboard.Copy.Text.self,
        Pasteboard.Copy.PropertyListAsBinary.self,
        Pasteboard.Copy.PropertyListAsXML.self,
        Pasteboard.Paste.Text.self,
        Pasteboard.Paste.PropertyList.self,
    ]
    
//    // TODO: register in ``BoopScripts/allTypes``
//    struct <#Name#>: BoopScript {
//        static func makeInstances() -> [Self] {
//            return [.init()]
//        }
//        
//        var descriptor: Descriptor {
//            Descriptor(
//                title: <#T##String#>,
//                systemImage: <#T##String#>,
//                description: <#T##String#>,
//                searchKeywords: <#T##[String]#>,
//            )
//        }
//        
//        func execute(in context: BoopContext) {
//            <#code#>
//        }
//    }
    
    struct Clear: BoopScript {
        static func makeInstances() -> [Self] {
            return [.init()]
        }
        
        var descriptor: Descriptor {
            Descriptor(
                title: "Clear",
                systemImage: "trash",
                description: "'abc' → ''",
                searchKeywords: [
                    "delete",
                    "empty",
                    "new",
                ]
            )
        }
        
        func execute(in context: BoopContext) {
            context.text = ""
        }
    }
    
    enum ChangeCase {
        struct Lowercase: BoopScript {
            static func makeInstances() -> [Self] {
                return [.init()]
            }
            
            var descriptor: Descriptor {
                Descriptor(
                    title: "Lowercase",
                    systemImage: "characters.lowercase",
                    description: "'ABC' → 'abc'",
                    searchKeywords: [
                        "case",
                        "small",
                        "down",
                    ]
                )
            }
            
            func execute(in context: BoopContext) {
                context.text = context.text.lowercased()
            }
        }
        
        struct Uppercase: BoopScript {
            static func makeInstances() -> [Self] {
                return [.init()]
            }
            
            var descriptor: Descriptor {
                Descriptor(
                    title: "Uppercase",
                    systemImage: "characters.uppercase",
                    description: "'abc' → 'ABC'",
                    searchKeywords: [
                        "case",
                        "big",
                        "up",
                    ]
                )
            }
            
            func execute(in context: BoopContext) {
                context.text = context.text.uppercased()
            }
        }
    }
    
    enum Pasteboard {
        enum Copy {
            struct Text: BoopScript {
                static func makeInstances() -> [Self] {
                    return [.init()]
                }
                
                var descriptor: Descriptor {
                    Descriptor(
                        title: "Push Text to Clipboard",
                        systemImage: "document.on.document",
                        description: "<#// TODO#>",
                        searchKeywords: [
                            "copy",
                            "pasteboard",
                            "clipboard",
                            "text",
                            "string",
                        ]
                    )
                }
                
                func execute(in context: BoopContext) {
                    UIPasteboard.general.strings = [context.text]
                }
            }
            
            struct PropertyListAsBinary: BoopScript {
                static func makeInstances() -> [Self] {
                    return [.init()]
                }
                
                var descriptor: Descriptor {
                    Descriptor(
                        title: "Push Plist to Clipboard as Binary",
                        systemImage: "document.on.document",
                        description: "<#// TODO#>",
                        searchKeywords: [
                            "copy",
                            "pasteboard",
                            "clipboard",
                            "binary",
                            "plist",
                            "bplist",
                            "property list",
                            "binary property list",
                        ]
                    )
                }
                
                func execute(in context: BoopContext) {
                    fatalError("<#// TODO#>")
                }
            }
            
            struct PropertyListAsXML: BoopScript {
                static func makeInstances() -> [Self] {
                    return [.init()]
                }
                
                var descriptor: Descriptor {
                    Descriptor(
                        title: "Push Plist to Clipboard as XML",
                        systemImage: "document.on.document",
                        description: "<#// TODO#>",
                        searchKeywords: [
                            "copy",
                            "pasteboard",
                            "clipboard",
                            "xml",
                            "plist",
                            "xmlplist",
                            "property list",
                            "xml property list",
                        ]
                    )
                }
                
                func execute(in context: BoopContext) {
                    fatalError("<#// TODO#>")
                }
            }
        }
        
        enum Paste {
            struct Text: BoopScript {
                static func makeInstances() -> [Self] {
                    return [.init()]
                }
                
                var descriptor: Descriptor {
                    Descriptor(
                        title: "Pull Text from Clipboard",
                        systemImage: "document.on.clipboard",
                        description: "<#// TODO#>",
                        searchKeywords: [
                            "paste",
                            "pasteboard",
                            "clipboard",
                            "text",
                            "string",
                        ]
                    )
                }
                
                func execute(in context: BoopContext) {
                    if let strings = UIPasteboard.general.strings {
                        context.text = strings.joined(separator: "\n\n")
                    }
                }
            }
            
            struct PropertyList: BoopScript {
                static func makeInstances() -> [Self] {
                    return [.init()]
                }
                
                var descriptor: Descriptor {
                    Descriptor(
                        title: "Pull Plist from Clipboard",
                        systemImage: "document.on.clipboard",
                        description: "<#// TODO#>",
                        searchKeywords: [
                            "paste",
                            "pasteboard",
                            "clipboard",
                            "binary",
                            "xml",
                            "plist",
                            "bplist",
                            "xmlplist",
                            "property list",
                            "binary property list",
                            "xml property list",
                        ]
                    )
                }
                
                func execute(in context: BoopContext) {
                    fatalError("<#// TODO#>")
                }
            }
        }
    }
}
