//
//  Coin.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

struct Coin {
    let name: String
    let rank: Int
    let price: Double
    let totalSupply: Int
    let maxSupply: Int
    let lastUpdated: String
    
    
    static func from(_ resource: CoinResource) -> Coin? {
        guard let price = resource.quotes["USD"]?.price else { return nil }
        return Coin(name: resource.name, rank: resource.rank, price: price, totalSupply: resource.totalSupply, maxSupply: resource.maxSupply, lastUpdated: resource.lastUpdated)
    }
}
