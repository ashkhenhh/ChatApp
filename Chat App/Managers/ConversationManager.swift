//
//  ConversationManager.swift
//  Chat App
//
//  Created by Ashkhen on 6/21/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation


class ConversationManager : Networkable {
    
    
    
    func fetchAllConversations(_ completion: @escaping CompletionValues<Conversation>) {
        guard let id = UserManager().currentID() else { completion([Conversation()]); return }
        objects(object: Conversation.self, parameters: ("userID", id)) { results in
            completion(results)
        }
    }
    
    func newConversation(userID: String, completion: @escaping (Response) -> Void) {
        guard let id = UserManager().currentID() else { completion(.failed); return }
        let conversation = Conversation()
        conversation.userID = id
        conversation.secondUserID = userID
        create(object: conversation) { (response) in
            completion(response)
        }
    }
}
