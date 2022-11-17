//
//  ViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 16.11.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: IB Outlets
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    //MARK: Private properties
    private let user = "User"
    private let password = "Password"
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVS = segue.destination as? WelcomeViewController else { return }
        welcomeVS.user = user
    }
    
    //MARK: IBActions
    @IBAction func logInPressed() {
        if userNameTF.text != user || passwordTF.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotRegisteredData(_ sender:UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your User Name is \(user)")
        : showAlert(title: "Oops", message: "Your password is \(password)")
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

//MARK: Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController:UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
