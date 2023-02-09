//
//  AppDelegate.swift
//  Navigation
//
//  Created by Иван Захаров on 31.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

    private func setupTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemMint
        tabBarController.viewControllers = [setupFeedNavigationController(), setupProfileNavigationController()]
        return tabBarController
    }

    private func setupFeedNavigationController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.tabBarItem = UITabBarItem(title: "Feedd", image: UIImage(systemName: "target"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }

    private func setupProfileNavigationController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        profileViewController.tabBarItem = UITabBarItem(title: "Prof", image: UIImage(systemName: "ellipsis.message"), tag: 1)
        return UINavigationController(rootViewController: profileViewController)
    }
}

