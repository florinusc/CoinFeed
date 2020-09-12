//
//  CoinTableViewCell.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var totalSupplyLabel: UILabel!
    @IBOutlet private weak var maxSupplyLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var lastUpdatedLabel: UILabel!
    
    // MARK: - Public functions
    func setUp(with viewModel: CoinViewModel) {
        nameLabel.text = viewModel.name
        rankLabel.text = viewModel.rank
        totalSupplyLabel.text = viewModel.totalSupply
        maxSupplyLabel.text = viewModel.maxSupply
        priceLabel.text = viewModel.price
        lastUpdatedLabel.text = viewModel.lastUpdated
    }
}
