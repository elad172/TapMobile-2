//
//  StringExtensions.swift
//  TapMobile#2
//
//  Created by Elad on 21/02/2021.
//

import Foundation

extension String {
    var youtubeID: String? {
        let pattern = "watch?v=[a-z0-9]*\""

        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)

        let results = regex?.matches(in: self, options: .withoutAnchoringBounds, range: range)
        print(results)
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }

        return (self as NSString).substring(with: result.range)
    }
}
