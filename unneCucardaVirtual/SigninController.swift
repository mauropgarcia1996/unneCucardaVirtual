//
//  SignupController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 18/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import Firebase

class SigninController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let loginController = HomeController()
    
    var arrayCareers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(goBack))
        
        view.addSubview(logoImageView)
        setupLogoImageView()
        
        
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(picker)
        view.addSubview(signinButton)

        setupTextFields()
        setupSigninButton()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)

        
        arrayCareers = ["Medicina","Lic. en Kinesiologia y Fisiatria","Lic. en Enfermeria"]
        
        picker.dataSource = self
        picker.delegate = self


    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTextFields() {
        
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        idTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        idTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        idTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        picker.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 5).isActive = true
        picker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        picker.widthAnchor.constraint(equalToConstant: 300).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    func setupLogoImageView() {
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        //logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }
    
    let logoImageView: UIImageView = {
        var image = UIImageView()
        let logo = UIImage(named: "logo")
        image = UIImageView(image: logo)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        //textField.keyboardType = UIKeyboardType.emailAddress
        textField.backgroundColor = UIColor.clear
//        textField.placeholder = "Nombre y Apellido"
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Nombre y Apellido", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        //textField.layer.borderWidth = 1
        //textField.layer.borderColor = UIColor(red: 141, green: 141, blue: 141, alpha: 100).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.backgroundColor = UIColor.clear
//        textField.placeholder = "Email"
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        //textField.layer.borderWidth = 1
        //textField.layer.borderColor = UIColor(red: 141, green: 141, blue: 141, alpha: 100).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = UIKeyboardType.numberPad
        textField.backgroundColor = UIColor.clear
//        textField.placeholder = "Numero de Libreta"
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Numero de Libreta", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        //textField.layer.borderWidth = 1
        //textField.layer.borderColor = UIColor(red: 141, green: 141, blue: 141, alpha: 100).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        //textField.keyboardType = UIKeyboardType.
        textField.backgroundColor = UIColor.clear
//        textField.placeholder = "Contraseña"
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        //textField.layer.borderWidth = 1
        //textField.layer.borderColor = UIColor(red: 141, green: 141, blue: 141, alpha: 100).cgColor
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCareers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "San Francisco Pro Text", size: 20)
        label.text =  arrayCareers[row]
        label.textAlignment = .center
        return label
    }
    
    var selectedCareer: String?
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCareer = arrayCareers[row]
    }
    
    
    let signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrarse", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //button.titleLabel?.font = UIFont(name: "SanFranciscoText-Semibold", size: 24)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline).withSize(24)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.6039215686, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(signin), for: .touchUpInside)
        return button
    }()
    
    
    func setupSigninButton() {
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        signinButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 62).isActive = true
    }
    
    
    
    
    @objc func signin() {
        self.showSpinner(onView: self.view)
        guard let name = nameTextField.text, let email = emailTextField.text, let id = idTextField.text, let career = selectedCareer, let password = passwordTextField.text/*, let userUID = Auth.auth().currentUser?.uid */else { return }
      
        let values = ["name": name, "email": email, "id": id, "career": career]
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print("Error generando usuario")
            } else {
                print("USUARIO CREADO EXITOSAMENTE")
                
                
                Auth.auth().signIn(withEmail: email, password: password, completion: { (authResult, error) in
                    if error != nil {
                        print("ERROR INGRESANDO")
                    } else {
                        print("EN LINEA CORRECTAMENTE")
                    }
                })
                
                let userUID = Auth.auth().currentUser?.uid
                let ref = Database.database().reference()
                ref.child("students").child(userUID!).updateChildValues(values)
                
                let barcodeImageView: UIImageView = {
                    let image = UIImageView()
                    let barcodeImage = Barcode.fromString(string: id)
                    let rotatedImage = barcodeImage?.rotate(radians: .pi/2)
                    image.image = rotatedImage
                    image.translatesAutoresizingMaskIntoConstraints = false
                    image.contentMode = .scaleToFill
                    //image.backgroundColor = UIColor.clear
                    image.layer.masksToBounds = true
                    return image
                }()
                
                let imageName = "idImage"
                let storageRef = Storage.storage().reference().child("id_images").child(userUID!).child("\(imageName).png")
                
                let uploadData = barcodeImageView.image!.jpegData(compressionQuality: 0.1)
                
                storageRef.putData(uploadData!, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error ?? "Error uploading image")
                        return
                    } else {
                        storageRef.downloadURL(completion: { (url, error) in
                            if error != nil {
                                print(error!.localizedDescription)
                                return
                            }
                           
                        })
                    }
                })
                
                let alertVC = UIAlertController(title: "Gracias!", message: "Ya podes iniciar sesion.", preferredStyle: .alert)
                let alertActionOkay = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction!) in
                    let vc = LoginController()
                    let nc = UINavigationController(rootViewController: vc)
                    self.present(nc, animated: true, completion: nil)
                }
                alertVC.addAction(alertActionOkay)
                self.removeSpinner()
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
}

class Barcode {
    class func fromString(string: String) -> UIImage? {
        let data = string.data(using: .ascii)
        
        // Generate the code image with CIFilter
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        
        // Scale it up (because it is generated as a tiny image)
        let scale = UIScreen.main.scale
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        guard let output = filter.outputImage?.transformed(by: transform) else { return nil }
        
        // Change the color using CIFilter
        let colorParameters = [
            "inputColor0": CIColor(color: UIColor.black), // Foreground
            "inputColor1": CIColor(color: UIColor.clear) // Background
        ]
        let colored = output.applyingFilter("CIFalseColor", parameters: colorParameters)
        
        return UIImage(ciImage: colored)
    }
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
