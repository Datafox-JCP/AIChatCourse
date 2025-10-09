//
//  ChatModel.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 09/10/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        let now = Date()
        let cal = Calendar.current
        
        let userIds  = ["u_alex", "u_bianca", "u_carlos", "u_dana"]
        let avatars  = ["avatar_01", "avatar_02", "avatar_03", "avatar_04"]
        
        // Generate N items with predictable spacing in time
        let count = 12
        let items: [ChatModel] = (0..<count).map { item in
            let created = cal.date(byAdding: .day, value: -(item * 2 + 1), to: now)!
            let modified = cal.date(byAdding: .hour, value: (item % 10) + 1, to: created)!
            
            return ChatModel(
                id: "mock_chat-\(String(format: "%03d", item))",
                userId: userIds[item % userIds.count],
                avatarId: avatars[item % avatars.count],
                dateCreated: created,
                dateModified: modified
            )
        }
        
        // Sort newest modified first (common in chat lists)
        return items.sorted { $0.dateModified > $1.dateModified }
    }
}
