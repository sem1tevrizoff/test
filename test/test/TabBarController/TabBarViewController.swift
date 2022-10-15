//
//  TabBarViewController.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let mainViewController = MainViewController(presenter: MainPresenter())
    private let contactsViewController = ContactsViewController()
    private let profileViewController = ProfileViewController()
    private let stashViewController = StashViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        setupTabBar()
    }

    private func configureTabBar() {
        self.setViewControllers([mainViewController, contactsViewController, profileViewController, stashViewController], animated: true)
        self.tabBar.contentMode = .scaleAspectFit
        self.tabBar.isTranslucent = false
        self.tabBar.alpha = 0.94
        self.tabBar.backgroundColor = .white
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .red
        self.navigationItem.titleView?.isHidden = false
    }
    
    private func setupTabBar() {
        mainViewController.title = "Меню"
        contactsViewController.title = "Контакты"
        profileViewController.title = "Профиль"
        stashViewController.title = "Корзина"
        
        mainViewController.tabBarItem.image = AssetsCatalog.menu.image
        contactsViewController.tabBarItem.image = AssetsCatalog.contacts.image
        profileViewController.tabBarItem.image = AssetsCatalog.profile.image
        stashViewController.tabBarItem.image = AssetsCatalog.stash.image
    }

}
    
