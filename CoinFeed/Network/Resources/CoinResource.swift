//
//  CoinResource.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 13/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

struct CoinResource: Decodable {
    
    let name: String
    let rank: Int
    let totalSupply: Int
    let maxSupply: Int
    let lastUpdated: String
    let quotes: [String: Quote]
    
    struct Quote: Decodable {
        let price: Double
    }
    
    enum CodingKeys: String, CodingKey {
        case name, rank, quotes
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case lastUpdated = "last_updated"
    }

}
