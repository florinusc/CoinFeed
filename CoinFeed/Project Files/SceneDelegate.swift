//
//  SceneDelegate.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureWindow(scene)
    }
    
    private func configureWindow(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let dogListViewController = CoinFeedViewController.getInstance(with: CoinFeedViewModel(repository: OnlineRepository()))
        let navigationController = UINavigationController(rootViewController: dogListViewController)
        navigationController.navigationBar.tintColor = .label
        window?.tintColor = .label
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

