//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            Text("Welcome to the Chat App")
                .navigationBarTitle("Welcome")
        }
    }
}

#Preview {
    WelcomeView()
}
