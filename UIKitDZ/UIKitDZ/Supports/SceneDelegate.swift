// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Constants

    private enum Constants {
        static let postsNavigationTitle = "Лента"
        static let postsNavigationImage = "iconPosts"
        static let notificationsNavigationTitle = "Уведомления"
        static let notificationsNavigationImage = "iconNotifications"
        static let profileNavigationTitle = "Профиль"
        static let profileNavigationImage = "iconProfile"
    }

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectingOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let postsNavigationController = UINavigationController(rootViewController: PostsViewController())
        let notificationsNavigationController =
            UINavigationController(rootViewController: NotificationsViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())

        tabBarController.setViewControllers(
            [
                postsNavigationController,
                notificationsNavigationController,
                profileNavigationController
            ],
            animated: true
        )

        postsNavigationController.tabBarItem = UITabBarItem(
            title: Constants.postsNavigationTitle,
            image: UIImage(named: Constants.postsNavigationImage),
            tag: 0
        )
        notificationsNavigationController.tabBarItem = UITabBarItem(
            title: Constants.notificationsNavigationTitle,
            image: UIImage(named: Constants.notificationsNavigationImage),
            tag: 1
        )
        profileNavigationController.tabBarItem = UITabBarItem(
            title: Constants.profileNavigationTitle,
            image: UIImage(named: Constants.profileNavigationImage),
            tag: 2
        )

        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .black

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
