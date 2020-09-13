//
//  OnlineRepository.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 13/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

class OnlineRepository: Repository {
    
    private let sessionManager = SessionManager()
    
    func getCoins(completion handler: @escaping (Result<[Coin], Error>) -> Void) {
        sessionManager.request(type: [CoinResource].self, requestType: .tickers) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let resources):
                let coins = resources.compactMap { Coin.from($0) }
                handler(.success(coins))
            }
        }
    }
}
