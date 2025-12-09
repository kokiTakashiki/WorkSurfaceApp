//
//  WorkSurfaceApp.swift
//  WorkSurfaceApp
//
//  Created by takashiki on 2025/12/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Properties

    var window: UIWindow?

    // MARK: Functions

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIViewController()
            self.window = window
            window.overrideUserInterfaceStyle = .dark
            window.makeKeyAndVisible()
        }
    }
}