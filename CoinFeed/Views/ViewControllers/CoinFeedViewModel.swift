//
//  CoinFeedViewModel.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

enum SortingCriteria: String, CaseIterable {
    case name, rank, price
}

final class CoinFeedViewModel: ViewModel {
    
    // MARK: - Public variables
    var numberOfCoins: Int {
        return coins.count
    }
    
    // MARK: - Private variables
    private var coins = [Coin]()
    
    // MARK: - Private constants
    let repository: Repository
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func coinViewModel(at index: Int) -> CoinViewModel? {
        guard index >= 0, index < coins.count else { return nil }
        return CoinViewModel(coin: coins[index])
    }
    
    func sort(by criteria: SortingCriteria) {
        switch criteria {
        case .name:
            coins.sort(by: { $0.name < $1.name })
        case .rank:
            coins.sort(by: { $0.rank < $1.rank })
        case .price:
            coins.sort(by: { $0.price > $1.price })
        }
    }
    
    // MARK: - Private functions
    private func getData(completion handler: @escaping (Error?) -> Void) {
        repository.getCoins { [weak self] (result) in
            switch result {
            case .failure(let error):
                handler(error)
            case .success(let coins):
                self?.coins = coins
                handler(nil)
            }
        }
    }
}

extension CoinFeedViewModel: CoinFeedViewDelegate {
    func viewDidLoad(completion handler: @escaping (Error?) -> Void) {
        getData(completion: handler)
    }
}
