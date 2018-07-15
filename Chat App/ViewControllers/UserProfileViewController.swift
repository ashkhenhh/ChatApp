//
//  UserProfileViewController.swift
//  Chat App
//
//  Created by Ashkhen on 6/19/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserProfileViewController: UIViewController, ContactsViewControllerDelegate {
    
    let manager = ConversationManager()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

   
    @IBAction func SignOutButtonTapped(_ sender: Any) {
        
        let signedOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            do {
                UserManager().signOut()
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginRegisterNav")
                self.present(vc!, animated: true, completion: nil)                
            }
//            catch let err {
//                print("Failed to sign out with error \(err)")
//               UserProfileViewController.showAlert(on: self, style: .alert, title: "Sign Out Error", message: err.localizedDescription)
//            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         AlertViewController.showAlert(on: self, style: .actionSheet, title: nil, message: nil, actions: [signedOutAction, cancelAction], completion: nil)
    }
    
    
    @IBAction func showContacts(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContactsViewController") as! ContactsViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    
    func didSelectUser(id: String) {
        manager.newConversation(userID: id) { (response) in
            print(response)
        }
    }
    
    
}
