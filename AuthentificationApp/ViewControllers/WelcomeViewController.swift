//
//  WelcomeViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 16.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var welcomeLabelText: UILabel!
    
    //MARK: Public properties
    var user = ""
    var welcomeLabel: String!
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabelText.text = "Привет, \(user)!"
    }
    
}   
