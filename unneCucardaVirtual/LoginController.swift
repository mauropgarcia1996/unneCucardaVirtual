//
//  LoginController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 18/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(goBack))
        
        view.addSubview(logoImageView)
        setupLogoImageView()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        setupTextFields()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)

        
        

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTextFields() {
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    let logoImageView: UIImageView = {
        var image = UIImageView()
        let logo = UIImage(named: "logo")
        image = UIImageView(image: logo)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    func setupLogoImageView() {
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        //logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        textField.placeholder = "Contraseña"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar Sesión", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.6039215686, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(showUserView), for: .touchUpInside)
        return button
    }()
    
    @objc func showUserView() {
        self.showSpinner(onView: self.view)
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (authResult, error) in
            if error != nil {
                print("ERROR INGRESANDO")
                
                let alertVC = UIAlertController(title: "Error!", message: "Email o Contraseña incorrectos", preferredStyle: .alert)
                let alertActionOkay = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }
                alertVC.addAction(alertActionOkay)
                self.present(alertVC, animated: true, completion: nil)
                
                
            } else {
                print("EN LINEA CORRECTAMENTE")
                let vc = UserViewController()
                let nc = UINavigationController(rootViewController: vc)
                self.removeSpinner()
                self.present(nc, animated: true, completion: nil)
            }
        })
    }
    
    
    
    
    
    


}
