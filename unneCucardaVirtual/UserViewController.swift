//
//  UserViewController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 18/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import JJFloatingActionButton

class UserViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar Sesion", style: .plain, target: self, action: #selector(showHomeView))
        
        
        tabBarController?.tabBar.barTintColor = UIColor.black
        tabBarItem.badgeColor = UIColor.black
        

        
        checkIfOnline()
        fetchUserInfo()
        
        view.addSubview(careerLabel)
        view.addSubview(profileImageView)
        view.addSubview(barcodeImageView)
        view.addSubview(nameLabel)
        view.addSubview(dniNumber)
        view.addSubview(idNumber)

        

        setupView()
        if #available(iOS 13.0, *) {
            isModalInPresentation = true
        } else {
            // Fallback on earlier versions
        }
        
        view.addSubview(actionbutton)
        
        actionbutton.addItem(title: "Informacion", image: nil) { (item) in
            let vc = InformationController()
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: true, completion: nil)
        }
        actionbutton.addItem(title: "Configuracion", image: nil) { (item) in
            let vc = Example2ViewController()
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: true, completion: nil)
        }
        
        actionbutton.translatesAutoresizingMaskIntoConstraints = false
        actionbutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        actionbutton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        

    }
    
   
    let actionbutton = JJFloatingActionButton()
    
    func checkIfOnline() {
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if snapshot.value as? Bool ?? false {
                print("CONNECTED")
            } else {
                print("Not connected")
            }
        })

    }

    
    
    func setupView() {
        
        careerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        careerLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        careerLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        careerLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: careerLabel.bottomAnchor, constant: 20).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 225).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        
        barcodeImageView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        barcodeImageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 5).isActive = true
        barcodeImageView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        barcodeImageView.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor/*, constant: -10)*/).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        dniNumber.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        dniNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        dniNumber.widthAnchor.constraint(equalToConstant: 250).isActive = true
        dniNumber.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        idNumber.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        idNumber.topAnchor.constraint(equalTo: dniNumber.bottomAnchor, constant: 5).isActive = true
        idNumber.widthAnchor.constraint(equalToConstant: 250).isActive = true
        idNumber.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    
    
    @objc func showHomeView() {
        let vc = HomeController()
        let nc = UINavigationController(rootViewController: vc)
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("logged out")
            nc.modalPresentationStyle = .fullScreen
            present(nc, animated: true, completion: nil)

        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    let careerLabel: UILabel = {
        let label = UILabel()
        label.text = "career"
        label.textColor = UIColor.gray
        label.font = UIFont.preferredFont(forTextStyle: .headline).withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        let profileImage = UIImage(named: "no-image")
        image.image = profileImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let barcodeImageView: UIImageView = {
        let image = UIImageView()
        
        let userUID = Auth.auth().currentUser?.uid
        let barcodeImage = Barcode.fromString(string: "00000")
        let rotatedImage = barcodeImage?.rotate(radians: .pi/2)
        
        let imageName = "idImage"
        let storageRef = Storage.storage().reference().child("id_images").child(userUID!).child("\(imageName).png")
        
        
        let placeholderImage = rotatedImage
        image.sd_setImage(with: storageRef, placeholderImage: placeholderImage)
       
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
//        image.backgroundColor = UIColor.clear
        image.layer.masksToBounds = true
        return image
    }()
   
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = UIColor.gray
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dniNumber: UILabel = {
        let label = UILabel()
        label.text = "XX.XXX.XXX"
        label.textColor = UIColor.gray
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let idNumber: UILabel = {
        let label = UILabel()
        label.text = "id"
        label.textColor = UIColor.gray
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func fetchUserInfo() {
        let uid = Auth.auth().currentUser?.uid
        
        Database.database().reference().child("students").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                guard let userEmail = dictionary["email"], let userName = dictionary["name"], let userId = dictionary["id"], let userCareer = dictionary["career"] else { return }
                print("Email: \(userEmail) // Nombre: \(userName) // Libreta: \(userId)")
                
                self.idNumber.text = "LU: \(userId as! String)"
                self.careerLabel.text = "\(userCareer as! String)"
                self.nameLabel.text = "\(userName as! String)"
                
               
            }
        }, withCancel: nil)
        
        
    }
    
    
    

}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


