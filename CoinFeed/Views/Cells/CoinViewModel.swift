//
//  CoinViewModel.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

struct CoinViewModel {
    
    // MARK: - Public constants
    let name: String
    let rank: String
    let totalSupply: String
    let maxSupply: String
    let price: String
    let lastUpdated: String
    
    // MARK: - Lifecycle
    init(coin: Coin) {
        name = coin.name
        rank = coin.rank.rankString
        totalSupply = "Total: " + coin.totalSupply.stringWithSeparator
        maxSupply = "Max: " + coin.maxSupply.stringWithSeparator
        price = coin.price.formattedPrice
        lastUpdated = "Last updated: " + (coin.lastUpdated.prettyDate ?? "Error")
    }
}
