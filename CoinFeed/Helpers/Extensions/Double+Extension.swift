//
//  Double+Extension.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

extension Double {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .halfEven
        let price = formatter.string(from: NSNumber(value: self)) ?? "PRICE ERROR"
        return "$\(price)"
    }
}
