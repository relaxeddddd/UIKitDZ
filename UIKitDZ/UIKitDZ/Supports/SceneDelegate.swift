// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectingOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let catalogController = CatalogViewController()
        let basketController = BasketViewController()
        let profileController = ProfileViewController()

        // добавляем навигацию
        let catalogNavigetionController = UINavigationController(rootViewController: catalogController)
        let basketNavigetionController = UINavigationController(rootViewController: basketController)
        let profileNavigetionController = UINavigationController(rootViewController: profileController)

        tabBarController.setViewControllers(
            [
                catalogNavigetionController,
                basketNavigetionController,
                profileNavigetionController
            ],
            animated: true
        )
        
        catalogController.tabBarItem =
            UITabBarItem(title: "Каталог", image: UIImage(named: "catalogIcon"), tag: 0)

        basketController.tabBarItem =
            UITabBarItem(title: "Корзина", image: UIImage(named: "basketIcon"), tag: 1)

        profileController.tabBarItem =
            UITabBarItem(title: "Профиль", image: UIImage(named: "profileIcon"), tag: 2)

        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(red: 255 / 255, green: 24 / 255, blue: 131 / 255, alpha: 1.0)

        window!.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
