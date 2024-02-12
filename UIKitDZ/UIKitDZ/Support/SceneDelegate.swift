// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
