//
//  CoinFeedViewModelTests.swift
//  CoinFeedTests
//
//  Created by Florin Uscatu on 14/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import CoinFeed

class CoinFeedViewModelTests: XCTestCase {
    
    let viewModel = CoinFeedViewModel(repository: MockRepository())

    override func setUpWithError() throws {
        viewModel.viewDidLoad { (error) in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func test_numberOfCoinsIsCorrect_successful() {
        XCTAssertEqual(viewModel.numberOfCoins, 2)
    }
    
    func test_coinViewModelAtValidIndexPathIsNotNil_successful() {
        XCTAssertNotNil(viewModel.coinViewModel(at: 1))
    }
    
    func test_coinViewModelAtInvalidIndexPathIsNil_successful() {
        XCTAssertNil(viewModel.coinViewModel(at: 4))
    }
    
    func test_sortByNameSortsCorrectly_successful() {
        viewModel.sort(by: .name)
        guard let firstName = viewModel.coinViewModel(at: 0)?.name, let secondName = viewModel.coinViewModel(at: 1)?.name else {
            XCTFail("Coin ViewModel is nil")
            return
        }
        XCTAssertTrue(firstName < secondName)
    }
    
    func test_sortByRankSortsCorrectly_successful() {
        viewModel.sort(by: .name)
        guard let firstRank = viewModel.coinViewModel(at: 0)?.rank, let secondRank = viewModel.coinViewModel(at: 1)?.rank else {
            XCTFail("Coin ViewModel is nil")
            return
        }
        XCTAssertTrue(firstRank < secondRank)
    }
    
    func test_sortByPriceSortsCorrectly_successful() {
        viewModel.sort(by: .name)
        guard let firstPrice = viewModel.coinViewModel(at: 0)?.price, let secondPrice = viewModel.coinViewModel(at: 1)?.price else {
            XCTFail("Coin ViewModel is nil")
            return
        }
        XCTAssertTrue(firstPrice < secondPrice)
    }

}
