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
    
    // MARK: - Private variables
    private weak var delegate: CoinFeedViewDelegate?
    
    // MARK: - Private constants
    private let refreshControl = UIRefreshControl()
    
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
        notifyViewModelToFetchData()
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
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(notifyViewModelToFetchData), for: .valueChanged)
    }
    
    @objc private func notifyViewModelToFetchData() {
        let loadingViewController = LoadingViewController()
        add(loadingViewController)
        delegate?.viewDidLoad { error in
            DispatchQueue.main.async { [weak self] in
                if let error = error {
                    loadingViewController.remove()
                    self?.presentAlert(for: error)
                    return
                }
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
                loadingViewController.remove()
            }
        }
    }
    
    private func displaySortingAlert() {
        let alert = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        for criteria in SortingCriteria.allCases {
            let action = UIAlertAction(title: criteria.rawValue.capitalized, style: .default) { [weak self] _ in
                self?.viewModel.sort(by: criteria)
                self?.tableView.reloadData()
            }
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction private func tappedOnSortButton() {
        displaySortingAlert()
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
