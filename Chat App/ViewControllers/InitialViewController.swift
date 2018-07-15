//
//  InitialViewController.swift
//  Chat App
//
//  Created by Haik Aslanyan on 6/13/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
        if UserManager().current() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MainNav")
            present(vc!, animated: true, completion: nil)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginRegisterNav")
            present(vc!, animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
