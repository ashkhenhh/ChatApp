//
//  NetworkableExtension.swift
//  Chat App
//
//  Created by Ashkhen on 6/25/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

extension Networkable {
    
    
    func create<T: FirestorageCodable>(object: T, completion: @escaping (Response) -> Void) {
        if let image = object.profilePic, let data = UIImagePNGRepresentation(image) {
            let ref = Storage.storage().reference().child(T.reference()).child(object.id).child(object.id + ".png")
            ref.putData(data, metadata: nil) { (metadata, error) in
                guard error == nil else {
                    Firestore.firestore().collection(T.reference()).document(object.id).setData(object.mappedData(), merge: true) { (error) in
                        if error == nil {
                            completion(.success)
                        } else {
                            completion(.failed)
                        }
                    }
                    return
                }
                ref.downloadURL(completion: { (url, _) in
                  object.profilePicLink = url?.absoluteString
                    Firestore.firestore().collection(T.reference()).document(object.id).setData(object.mappedData(), merge: true) { (error) in
                        if error == nil {
                            completion(.success)
                        } else {
                            completion(.failed)
                        }
                    }
                })
            }
        } else {
            Firestore.firestore().collection(T.reference()).document(object.id).setData(object.mappedData(), merge: true) { (error) in
                if error == nil {
                    completion(.success)
                } else {
                    completion(.failed)
                }
            }
        }
    }
    
//    func create<T: FirestoreCodable>(object: T, completion: @escaping (Response) -> Void) {
//        Firestore.firestore().collection(T.reference()).document(object.id).setData(object.mappedData(), merge: true) { (error) in
//            if error == nil {
//                completion(.success)
//            } else {
//                completion(.failed)
//            }
//        }
//    }
    
    func objects<T: FirestoreCodable>(object: T.Type, parameters: (String, Any)?, completion: @escaping CompletionValues<T>){
        if let par = parameters {
            Firestore.firestore().collection(T.reference()).whereField(par.0, isEqualTo: par.1).getDocuments(completion: { (snapshot, _) in
                var objects = [T]()
                snapshot?.documents.forEach({ (document) in
                    if let element = T.init(document.data()) {
                        objects.append(element)
                    }
                })
                completion(objects)
            })
        } else {
            Firestore.firestore().collection(T.reference()).getDocuments(completion: { (snapshot, _) in
                var objects = [T]()
                snapshot?.documents.forEach({ (document) in
                    if let element = T.init(document.data()) {
                        objects.append(element)
                    }
                })
                completion(objects)
            })
        }
    }
}
