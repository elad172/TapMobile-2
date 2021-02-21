//
//  RegExExtensions.swift
//  TapMobile#2
//
//  Created by Elad on 21/02/2021.
//

import Foundation

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch  {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    convenience init(_ pattern: String, options: NSRegularExpression.Options) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch  {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

