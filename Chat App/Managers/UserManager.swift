//
//  UserManager.swift
//  Chat App
//
//  Created by Haik Aslanyan on 6/13/18.
//  Copyright © 2018 Haik Aslanyan. All rights reserved.
//

import Foundation
import FirebaseAuth

class UserManager {
    
    
    func current() -> Bool {
        if Auth.auth().currentUser == nil {
            return false
        }
        return true
    }
    
    func login (email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(false)
            }
            completion(true)
        }
    }
    
}
