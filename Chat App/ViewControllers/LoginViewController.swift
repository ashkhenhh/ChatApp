//
//  LoginViewController.swift
//  Chat App
//
//  Created by Haik Aslanyan on 6/13/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        guard let password = passwordTextField.text, password.isValidPassword() else {
            let sheet = UIAlertController.init(title: "Warning", message: "Incorrect password", preferredStyle: .alert)
            let cancelAction = UIAlertAction.init(title: "Okay", style: .cancel) { _ in
                self.passwordTextField.text = nil
            }
            sheet.addAction(cancelAction)
            present(sheet, animated: true, completion: nil)
            return
        }
        
        guard let email = emailTextField.text, email.isValidEmail() else {
            let sheet = UIAlertController(title: "Warning", message: "Incorrect Email", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { _ in
                self.emailTextField.text = nil
            }
            sheet.addAction(cancelAction)
            present(sheet, animated: true, completion: nil)
            return
        }
        
        
        UserManager().login(email: email, password: password) { status in
            
            switch status {
            case .success:  self.navigationController?.dismiss(animated: true, completion: nil)
            case .noInternetConnection: print("No Internet Connection")
            case .failed: print("Failed to login")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController")
                self.show(vc!, sender: self)
            }

        }
        
        
        
        
        
        
    }
    
    
    
    
    
   
    


}
