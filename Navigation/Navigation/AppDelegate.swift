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
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .white
        return true
    }

    private func setupTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray5
        tabBarController.viewControllers = [setupFeedNavigationController(), setupProfileNavigationController()]
        return tabBarController
    }

    private func setupFeedNavigationController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "square.and.pencil.circle.fill"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }

    private func setupProfileNavigationController() -> UINavigationController {
        let profileViewController = LogInViewController()
        profileViewController.title = "Профиль"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        return UINavigationController(rootViewController: profileViewController)
    }
}
