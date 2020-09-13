//
//  CoinViewModelTests.swift
//  CoinFeedTests
//
//  Created by Florin Uscatu on 13/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import CoinFeed

class CoinViewModelTests: XCTestCase {
    
    let coinViewModel = CoinViewModel(coin: Coin(name: "Bitcoin", rank: 1, price: 10000, totalSupply: 19202303, maxSupply: 21000000, lastUpdated: "2017-12-17T12:19:00Z"))
    
    func test_coinNameIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.name, "Bitcoin")
    }
    
    func test_coinRankIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.rank, "1st")
    }
    
    func test_coinPriceIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.price, "$10,000.00")
    }
    
    func test_totalSupplyIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.totalSupply, "Total: 19,202,303")
    }
    
    func test_maxSupplyIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.maxSupply, "Max: 21,000,000")
    }
    
    func test_lastUpdateDataIsCorrect_succesful() {
        XCTAssertEqual(coinViewModel.lastUpdated, "Last updated: 12/17/17, 2:19 PM")
    }
    
}
