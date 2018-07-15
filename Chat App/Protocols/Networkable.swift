//
//  Networkable.swift
//  Chat App
//
//  Created by Ashkhen on 6/21/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation


protocol Networkable {
    func create<T: FirestorageCodable>(object: T, completion: @escaping (Response) -> Void)
   // func create<T: FirestoreCodable>(object: T, completion: @escaping (Response) -> Void)
    func objects<T: FirestoreCodable>(object: T.Type, parameters: (String, Any)?, completion: @escaping CompletionValues<T>)
   
}
