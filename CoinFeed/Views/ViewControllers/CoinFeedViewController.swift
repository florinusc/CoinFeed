//
//  ViewController.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

protocol CoinFeedViewDelegate: class {
    func viewDidLoad(completion handler: (Error?) -> Void)
}

class CoinFeedViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private constants
    private let viewModel = CoinFeedViewModel()
    private weak var delegate: CoinFeedViewDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        delegate?.viewDidLoad { [weak self] error in
            if let error = error {
                // present error alert
                
            }
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Private methods
    private func setUp() {
        delegate = viewModel
        setUpNavBar()
        setUpTableView()
    }
    
    private func setUpNavBar() {
        title = "Coins"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setUpTableView() {
        tableView.register(CoinTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = CGFloat.leastNonzeroMagnitude
    }
    
}

extension CoinFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCoins
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CoinTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let cellViewModel = viewModel.coinViewModel(at: indexPath.row) {
            cell.setUp(with: cellViewModel)
        }
        return cell
    }
}
