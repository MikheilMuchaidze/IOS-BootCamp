//
//  SceneDelegate.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        setupInitialViewController(with: scene)
    }
}

extension SceneDelegate {
    private func setupInitialViewController(with scene: UIWindowScene) {
        let initialController = CountriesConfigurator.configure()
        let navigationController = UINavigationController(rootViewController: initialController)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
