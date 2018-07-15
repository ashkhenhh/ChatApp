//
//  RegisterViewController.swift
//  Chat App
//
//  Created by Ashkhen on 6/13/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit
import Photos

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let picker = ImagePickerService()
    let user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
       
    }

    @IBAction func selectPicture(_ sender: Any) {
        picker.pick(from: self) {[weak self] image in
            self?.profileImageView.image = image
            self?.user.profilePic = image
        }
    }
    

    @IBAction func registerButtonTapped(_ sender: Any) {
        
        
        user.name = nameTextField.text
        user.lastName = lastNameTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
       
        
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
        
        ThemeService.showLoading(true)
        UserManager().register(user: user) { [weak self] status in
            ThemeService.showLoading(false)
            guard let weakSelf = self else { return }
            
            switch status {
            case .success: weakSelf.navigationController?.dismiss(animated: true, completion: nil)
            case .noInternetConnection: print("No Internet Connection")
            case .failed: print("Failed to register")
                
            }

        }
        
    }
    
    
    
   
}
