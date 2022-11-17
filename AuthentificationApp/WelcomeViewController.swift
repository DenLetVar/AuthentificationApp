//
//  WelcomeViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 16.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabelText: UILabel!
    
    var user = ""
    var welcomeLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabelText.text = "Hello, \(user)!"
    }
    
}   
