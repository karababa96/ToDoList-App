//
//  WelcomeViewController.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 9.04.2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewControllers are set up in here
        let vc1 = DailyViewController()
        let vc2 = WeeklyViewController()
        let vc3 = MonthlyViewController()
        let vc4 = SettingsViewController()
        
    
         // ViewControllers Titles
        vc1.title = "Daily"
        vc2.title = "Weekly"
        vc3.title = "Monthly"
        vc4.title = "Settings"
       

        // Large title settings
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        
        // Navigation Contollers are set up in here
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)

       //  Title Settings
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        // Tabbar Item set up in here
        nav1.tabBarItem = UITabBarItem(title: "Daily", image: UIImage(systemName: "book"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Weekly", image: UIImage(systemName: "book"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Monthly", image: UIImage(systemName: "book"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        // Set ViewController in order to display.
       setViewControllers([nav1,nav2,nav3,nav4], animated: false)
    }



}
