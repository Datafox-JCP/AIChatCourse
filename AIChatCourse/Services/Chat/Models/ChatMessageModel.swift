//
//  ChatMessageModel.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 09/10/25.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
}

extension ChatMessageModel {
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let cal = Calendar(identifier: .gregorian)
        let base = cal.date(byAdding: .day, value: -1, to: Date())! // yesterday as anchor
        
        let chats   = ["chat-000", "chat-001"]
        let authors = ["u_alex", "u_bianca", "u_carlos", "u_dana"]
        
        func ts(_ minutesFromBase: Int) -> Date {
            cal.date(byAdding: .minute, value: minutesFromBase, to: base)!
        }
        func id(_ nmsg: Int) -> String { String(format: "msg-%04d", nmsg) }
        
        var mesg: [ChatMessageModel] = []
        
        // --- chat-000 thread ---
        mesg.append(.init(
            id: id(0),
            chatId: chats[0],
            authorId: nil,                                // system message
            content: "Chat created",
            seenByIds: [],
            dateCreated: ts(0)
        ))
        mesg.append(.init(
            id: id(1),
            chatId: chats[0],
            authorId: authors[0],
            content: "Hey team 👋",
            seenByIds: [authors[1]],
            dateCreated: ts(2)
        ))
        mesg.append(.init(
            id: id(2),
            chatId: chats[0],
            authorId: authors[1],
            content: "Hi! Ready for the standup?",
            seenByIds: [authors[0], authors[1]],
            dateCreated: ts(4)
        ))
        mesg.append(.init(
            id: id(3),
            chatId: chats[0],
            authorId: authors[2],
            content: "Blocking on API keys, anyone can help?",
            seenByIds: nil,                                // nil = unknown/uncomputed
            dateCreated: ts(7)
        ))
        mesg.append(.init(
            id: id(4),
            chatId: chats[0],
            authorId: authors[0],
            content: nil,                                  // e.g. attachment message
            seenByIds: [authors[1], authors[2]],
            dateCreated: ts(9)
        ))
        mesg.append(.init(
            id: id(5),
            chatId: chats[0],
            authorId: authors[3],
            content: "Pushed a fix to main.",
            seenByIds: [authors[0], authors[1], authors[2], authors[3]],
            dateCreated: ts(12)
        ))
        
        // --- chat-001 thread ---
        mesg.append(.init(
            id: id(6),
            chatId: chats[1],
            authorId: nil,                                // system message
            content: "Chat created",
            seenByIds: [],
            dateCreated: ts(1)
        ))
        mesg.append(.init(
            id: id(7),
            chatId: chats[1],
            authorId: authors[2],
            content: "Drafting the proposal now.",
            seenByIds: [authors[3]],
            dateCreated: ts(5)
        ))
        mesg.append(.init(
            id: id(8),
            chatId: chats[1],
            authorId: authors[3],
            content: "Can you add a budget section?",
            seenByIds: [authors[2], authors[3]],
            dateCreated: ts(8)
        ))
        mesg.append(.init(
            id: id(9),
            chatId: chats[1],
            authorId: authors[1],
            content: "I'll review after lunch.",
            seenByIds: nil,
            dateCreated: ts(11)
        ))
        mesg.append(.init(
            id: id(10),
            chatId: chats[1],
            authorId: authors[2],
            content: nil,                                  // another attachment/voice note
            seenByIds: [authors[1]],
            dateCreated: ts(13)
        ))
        mesg.append(.init(
            id: id(11),
            chatId: chats[1],
            authorId: authors[1],
            content: "Looks good—sent to the client ✅",
            seenByIds: [authors[2], authors[3]],
            dateCreated: ts(16)
        ))
        
        // Stable order (oldest first), good for lists and sectioning by day.
        return mesg.sorted { ($0.dateCreated ?? .distantPast) < ($1.dateCreated ?? .distantPast) }
    }
}
