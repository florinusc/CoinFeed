//
//  ViewController.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

protocol CoinFeedViewDelegate: class {
    func viewDidLoad(completion handler: @escaping (Error?) -> Void)
}

final class CoinFeedViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Public variables
    var viewModel: CoinFeedViewModel!
    
    // MARK: - Private constants
    private weak var delegate: CoinFeedViewDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - Private methods
    private func setUp() {
        delegate = viewModel
        setUpNavBar()
        setUpTableView()
        notifyViewModel()
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
    
    private func notifyViewModel() {
        let loadingViewController = LoadingViewController()
        add(loadingViewController)
        delegate?.viewDidLoad { [weak self] error in
            DispatchQueue.main.async { [weak self] in
                if let error = error {
                    loadingViewController.remove()
                    self?.presentAlert(for: error)
                    return
                }
                self?.tableView.reloadData()
                loadingViewController.remove()
            }
        }
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

extension CoinFeedViewController: ViewModelBased, Storyboarded {
    static var storyboardName: String { return "Main" }
}
