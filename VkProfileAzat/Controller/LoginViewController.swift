//
//  LoginViewController.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 30.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailOrNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let userEmailOrNumber = emailOrNumberTextField.text
        let userPassword = passwordTextField.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "User emails")
        let userPasswordStored = UserDefaults.standard.string(forKey: "User password")
        let userNumberStored = UserDefaults.standard.string(forKey: "User number")
        
        if userEmailOrNumber == userEmailStored ||  userEmailOrNumber == userNumberStored {
            if userPassword == userPasswordStored {
            performSegue(withIdentifier: "EnterIdentefier", sender: nil)
            } else {
            displayMyAlertMessage(userMessage: "Wrong login or password")
            }
        } else {
            displayMyAlertMessage(userMessage: "Wrong login or password")
        }
        
    }
    func displayMyAlertMessage(userMessage : String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okButton)
        present(myAlert, animated: true, completion: nil)
    }
}
