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
        rank = String(coin.rank)
        totalSupply = String(coin.totalSupply)
        maxSupply = String(coin.maxSupply)
        price = String(coin.price)
        lastUpdated = coin.lastUpdated
    }
}
