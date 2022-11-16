//
//  ViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 16.11.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVS = segue.destination as! WelcomeViewController
        welcomeVS.welcomeLabel = "Welcome , \(userNameTF.text ?? "") "
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

