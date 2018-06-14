//
//  StringExtension.swift
//  Chat App
//
//  Created by Haik Aslanyan on 6/14/18.
//  Copyright © 2018 Haik Aslanyan. All rights reserved.
//

import Foundation

extension String {
    
    func isValidPassword() -> Bool {
        return self.count > 4
    }
    
    func isValidEmail() -> Bool {
        return self.count > 4
    }
    
}


extension Optional {
    
    func isSome() -> Bool {
        return self != nil
    }
}





