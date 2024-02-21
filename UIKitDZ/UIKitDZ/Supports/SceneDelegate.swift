// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectingOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let postsNavigetionController = UINavigationController(rootViewController: PostsViewController())
        let notificationsNavigationController =
            UINavigationController(rootViewController: NotificationsViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())

        tabBarController.setViewControllers(
            [
                postsNavigetionController,
                notificationsNavigationController,
                profileNavigationController
            ],
            animated: true
        )

        postsNavigetionController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(named: "iconPosts"), tag: 0)
        notificationsNavigationController.tabBarItem = UITabBarItem(
            title: "Уведомления",
            image: UIImage(named: "iconNotifications"),
            tag: 1
        )
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "iconProfile"),
            tag: 2
        )

        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .black

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
