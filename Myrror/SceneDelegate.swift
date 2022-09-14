//
//  SceneDelegate.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: ViewController())
//        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        self.window = window
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
    }
}
