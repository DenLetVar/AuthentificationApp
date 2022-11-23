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
    let user = User.getUser()
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        let viewControllers = tabBarController.viewControllers!
        for viewController in viewControllers {
            if let welcomeVS = viewController as? WelcomeViewController {
                welcomeVS.user = "\(user.person.name) \(user.person.surname)"
            } else if let navigationVC = viewController as? UINavigationController{
                let aboutVC = navigationVC.topViewController as! AboutMeViewController
                navigationVC.tabBarItem.title = "\(user.person.name) \(user.person.surname)"
                aboutVC.navigationItem.title = "\(user.person.name) \(user.person.surname)"
                aboutVC.text = "\(user.person.about). Мне \(user.person.age) лет."
            }
        }
    }

    
    //MARK: IBActions
    @IBAction func logInPressed() {
        if userNameTF.text != user.userName || passwordTF.text != user.password {
            showAlert(
                title: "Неверный логин или пароль",
                message: "Пожалуйста введите провильный логин или пароль",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotRegisteredData(_ sender:UIButton) {
        sender.tag == 0
        ? showAlert(title: "Упс", message: "Ваш логин \(user.userName)")
        : showAlert(title: "Упс", message: "Ваш пароль \(user.password)")
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
            performSegue(withIdentifier: "showWelcomeVS", sender: nil)
        }
        return true
    }
}
