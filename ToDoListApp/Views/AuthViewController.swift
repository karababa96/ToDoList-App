//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 9.04.2021.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    let emailText = UITextField()
    let passwordText = UITextField()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        emailText.frame = CGRect(x: 20, y: view.height-550-view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
        emailText.placeholder = "User Name"
        emailText.textAlignment = .center
        emailText.layer.cornerRadius = 9
        emailText.layer.borderWidth = 2
        emailText.layer.borderColor = UIColor.black.cgColor
        emailText.backgroundColor = .white
        emailText.alpha = 1
        view.addSubview(emailText)
        
        
        passwordText.frame = CGRect(x: 20, y: view.height-490-view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
        passwordText.placeholder = "Password"
        passwordText.textAlignment = NSTextAlignment.center
        passwordText.layer.cornerRadius = 9
        passwordText.layer.borderWidth = 2
        passwordText.layer.borderColor = UIColor.black.cgColor
        passwordText.backgroundColor = .white
        view.addSubview(passwordText)
        
        
        signInButton.frame = CGRect(x: 20, y: view.height-420-view.safeAreaInsets.bottom, width: 120, height: 40)
        signInButton.layer.cornerRadius = 9
        signInButton.layer.borderColor = UIColor.black.cgColor
        signInButton.layer.borderWidth = 2
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        view.addSubview(signInButton)
        
       
        signUpButton.frame = CGRect(x: view.frame.maxX - 140, y: view.height-420-view.safeAreaInsets.bottom, width: 120, height: 40)
        signUpButton.layer.cornerRadius = 9
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.borderWidth = 2
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    
    @objc func signUpAction() {

        if self.emailText.text! != "" && self.passwordText.text! != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else {
                    let vc = TabBarController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        }
        
    }
    
    
    @objc func signInAction() {
     
        if self.emailText.text! != "" && self.passwordText.text! != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else {
                    let vc = TabBarController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let ac = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        self.present(ac, animated: true)
        
    }
    
}

