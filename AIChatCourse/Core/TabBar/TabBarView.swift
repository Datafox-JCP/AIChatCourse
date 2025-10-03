//
//  TabBarView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Explorar", systemImage: "eyes") {
                ExploreView()
            }
            
            Tab("Chats", systemImage: "bubble.left.and.bubble.right") {
                ChatsView()
            }
            
            Tab("Perfil", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    TabBarView()
}
