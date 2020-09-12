//
//  String+Extension.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

extension Int {
    var rankString: String {
        var lastDigit: Int {
            let rankString = String(self)
            return Int(String(Array(rankString)[rankString.count - 1])) ?? 0
        }
        switch lastDigit {
        case 1: return "\(self)st"
        case 2: return "\(self)nd"
        case 3: return "\(self)rd"
        default: return "\(self)th"
        }
    }
    
    var stringWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter.string(for: self) ?? ""
    }
}
