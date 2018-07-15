//
//  UserManager.swift
//  Chat App
//
//  Created by Ashkhen on 6/13/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//


import FirebaseAuth


class UserManager: Networkable {
    
    
    func current() -> Bool {
        if Auth.auth().currentUser.isSome() {
            return true
        }
        return false
    }
    
    func currentID() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    
    func login(email: String, password: String, completion: @escaping (Response) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        Auth.auth().signInAndRetrieveData(with: credential) { (result, _) in
            guard let id = result?.user.uid else {
                completion(.failed)
                return
            }
            self.objects(object: User.self,parameters: nil, completion: { (results) in
                for user in results {
                    if user.id == id {
                        completion(.success)
                        return
                    }
                }
                completion(.failed)
                return
            })
        }
    }
    
    

    
    
    
    

    
    func register(user: User, completion: @escaping (Response) -> Void) {
        guard let email = user.email, let password = user.password else {
            completion(.failed)
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let id = result?.user.uid else {
                completion(.failed); return }
            user.id = id
            self.create(object: user, completion: { (status) in
                completion(status)
            })
        }
    }
    
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    func allUsers(completion: @escaping CompletionValues<User>) {
        guard let id = Auth.auth().currentUser?.uid else { completion([User]()); return }
        objects(object: User.self, parameters: nil) { (results) in
            let filteredUsers = results.filter({ (user) -> Bool in
                if user.id == id {
                    return false
                }
                return true
            })
            completion(filteredUsers)
        }
    }
    
}


enum Response {
    case noInternetConnection
    case failed
    case success
}
