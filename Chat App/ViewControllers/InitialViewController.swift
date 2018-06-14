//
//  InitialViewController.swift
//  Chat App
//
//  Created by Haik Aslanyan on 6/13/18.
//  Copyright © 2018 Haik Aslanyan. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserManager().current().isSome() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MainNav")
            present(vc!, animated: true, completion: nil)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginRegisterNav")
            present(vc!, animated: true, completion: nil)
        }
    }
}
