//
//  Conversation.swift
//  Chat App
//
//  Created by Ashkhen on 6/21/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation
import UIKit

class Conversation: FirestorageCodable {
    
    var profilePic: UIImage?
    
    var profilePicLink: String?
    
    var id = UUID().uuidString
    var userID: String?
    var secondUserID: String?
    var isRead = true
    var isSecondUserRead = true
    var lastMessage: String?
    
    static func reference() -> String {
        return "Conversations"
    }
    
    required convenience init?(_ values: [String : Any]?) {
        guard let data = values, let id = data["id"] as? String else { return nil }
        self.init()
        self.id = id
        userID = data["userID"] as? String
        secondUserID = data["secondUserID"] as? String
        isRead = data["isRead"] as? Bool ?? true
        isSecondUserRead = data["isSecondUserRead"] as? Bool ?? true
        lastMessage = data["lastMessage"] as? String
    }
    
    init() {}
    
    func mappedData() -> [String : Any] {
        var data = [String: Any]()
        data ["id"] = id
        data["userID"] = userID
        data["secondUserID"] = secondUserID
        data["isRead"] = isRead
        data["isSecondUserRead"] = isSecondUserRead
        data["lastMessage"] = lastMessage
        return data
    }
    
    
}
