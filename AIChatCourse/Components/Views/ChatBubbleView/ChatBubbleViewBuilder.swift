//
//  ChatBubbleViewBuilder.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 18/10/25.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser = false
    var imageName: String?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 64 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 64)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Este es un mensaje largo que se extiende por múltiples líneas y sigue y sigue.",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
            ChatBubbleViewBuilder()
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Este es un mensaje largo que se extiende por múltiples líneas y sigue y sigue.",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
        }
        .padding(16)
    }
}
