//
//  SceneDelegate.swift
//  WorkSurfaceApp
//
//  Created by takashiki on 2025/12/07.
//

import UIKit
import WorkSurfaceiOSApp
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Properties

    var window: UIWindow?

    // MARK: Functions

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: WorkSurfaceWelcomeView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
