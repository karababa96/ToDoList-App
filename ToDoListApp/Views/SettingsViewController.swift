//
//  SettingsViewController.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 9.04.2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

       
        let logOutButton = UIButton()
        logOutButton.frame = CGRect(x: 20, y: view.frame.height-300-view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
        logOutButton.layer.borderWidth = 2
        logOutButton.layer.cornerRadius = 9
        logOutButton.layer.borderColor = UIColor.black.cgColor
        logOutButton.setTitle("Log Out!", for: .normal)
        logOutButton.setTitleColor(.black, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        view.addSubview(logOutButton)
    }
    
    @objc func logOutAction() {
      
        try! Auth.auth().signOut()
        
        let vc = AuthViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
        navigationController?.navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = true
        navigationController?.accessibilityElementsHidden = true
    }
}
