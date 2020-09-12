//
//  Repository.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

protocol Repository {
    func getCoins(completion handler: (Result<[Coin], Error>) -> Void)
}
