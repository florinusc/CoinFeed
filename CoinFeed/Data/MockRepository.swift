//
//  MockRepository.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

class MockRepository: Repository {
    
    private let returnError: Bool
    
    init(_ returnError: Bool = false) {
        self.returnError = returnError
    }
    
    func getCoins(completion handler: @escaping (Result<[Coin], Error>) -> Void) {
        if returnError {
            handler(.failure(CustomError.general))
            return
        }
        let bitcoin = Coin(name: "Bitcoin", rank: 1, price: 10000, totalSupply: 19202303, maxSupply: 21000000, lastUpdated: "2017-12-17T12:19:00Z")
        let ethereum = Coin(name: "Ethereum", rank: 2, price: 372, totalSupply: 112571243, maxSupply: 992571243, lastUpdated: "2020-09-12T12:32:41Z")
        handler(.success([bitcoin, ethereum]))
    }
}
