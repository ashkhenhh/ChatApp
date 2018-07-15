//
//  FireCodable.swift
//  Chat App
//
//  Created by Ashkhen on 6/19/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation
import UIKit


protocol FirestoreCodable: class {  // menak classner@ karox en confirm anel 
    
    var id: String {get set}
    
    static func reference() -> String
    
    func mappedData() -> [String: Any]
    
    init?(_ values: [String: Any]?)
}

protocol FirestorageCodable: FirestoreCodable {
    var profilePic: UIImage? {get set}
    var profilePicLink: String? {get set}
    
}
