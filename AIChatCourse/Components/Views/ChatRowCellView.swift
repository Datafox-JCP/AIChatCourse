//
//  ChatRowCellView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 09/10/25.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var headline: String? = "Fionna"
    var subheadline: String? = "Un gato durmiendo en su cama."
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NUEVO")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 6))
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: UIColor.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(imageName: nil, hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(headline: nil)
                .removeListRowFormatting()
            ChatRowCellView(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }
    }
}
