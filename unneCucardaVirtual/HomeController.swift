//
//  ViewController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 18/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
//        navigationController?.navigationBar.barStyle = .default
//        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        view.addSubview(logoImageView)
        setupLogoImageView()
        
        view.addSubview(loginButton)
        setupLoginButton()
        
        view.addSubview(signinButton)
        setupSigninButton()
       
        
        checkIfUserIsLoggedIn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      self.navigationController?.navigationBar.barStyle = .blackTranslucent
//      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    
    
    // MODEL
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            print("NO USER LOGGED IN")
        } else {
            print("USER UID \(Auth.auth().currentUser?.uid as Any)")
            let userViewController = UserViewController()
            let nc = UINavigationController(rootViewController: userViewController)
            present(nc, animated: true, completion: nil)
        }
    }
    
    @objc func handleHomeView() {
        do {
            try Auth.auth().signOut()
            print("logged out")
            //self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    
    }
    
    // VIEW
    
    func setupLogoImageView() {
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupSigninButton() {
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        signinButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    let logoImageView: UIImageView = {
        var image = UIImageView()
        let logo = UIImage(named: "logo")
        image = UIImageView(image: logo)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar Sesión", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //button.titleLabel?.font = UIFont(name: "San Francisco Pro Text", size: 17)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.6039215686, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(showLoginView), for: .touchUpInside)
        return button
    }()
    
    let signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrarse", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //button.titleLabel?.font = UIFont(name: "SF-Pro-Text-Regular", size: 17)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.6039215686, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(showSigninView), for: .touchUpInside)
        return button
    }()
    
    @objc func showSigninView() {
        let vc = SigninController()
        let nc = UINavigationController(rootViewController: vc)
        
        present(nc, animated: true, completion: nil)
    }
    
    @objc func showLoginView() {
        let vc = LoginController()
        let nc = UINavigationController(rootViewController: vc)
        
        present(nc, animated: true, completion: nil)
    }
    


}

