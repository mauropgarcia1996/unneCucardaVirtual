//
//  Example1ViewController.swift
//  unneCucardaVirtual
//
//  Created by Mauro Garcia on 25/05/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit

class InformationController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.red
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(goBack))
        navigationItem.title = "Información"
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = infoArray[indexPath.row]
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    let infoArray = [
    "Politica de Privacidad",
    "Contacto",
    "Derechos"]
    

}
