//
//  Example2ViewController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 25/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit

class Example2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(goBack))
        view.backgroundColor = UIColor.white
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
        
//        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView = UITableView(frame: .zero, style: .plain)
        myTableView.tableFooterView = UIView(frame: .zero)

        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        view.addSubview(profileImageView)
        
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        profileImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        profileImageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
//        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = "MAURO GARCIA"
        return cell
    }
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        let profileImage = UIImage(named: "profile")
        image.image = profileImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    

}
