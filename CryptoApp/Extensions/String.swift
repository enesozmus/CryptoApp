//
//  String.swift
//  CryptoApp
//
//  Created by enesozmus on 27.05.2024.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
