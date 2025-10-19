//
//  ChatBubbleView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 18/10/25.
//

import SwiftUI

struct ChatBubbleView: View {
    
    var text = "Texto muestra"
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var showImage = true
    var imageName: String?
    
    let offset: CGFloat = 16
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .offset(y: offset)
            }
            
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 8))
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            
            ChatBubbleView(text: "Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo. Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo.")
            
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
            
            ChatBubbleView(text: "Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo. Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo.")
            
            ChatBubbleView(
                text: "Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo. Este es un mensaje con mucho texto que prosigie por varias líneas y sigue creciendo.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
        }
        .padding(8)
    }
}
