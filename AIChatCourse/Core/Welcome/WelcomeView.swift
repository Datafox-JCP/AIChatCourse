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
            VStack {
                Text("Welcome to the Chat App")
                    .frame(maxHeight: .infinity)
                
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get Started")
                        .callToActionButton()
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    WelcomeView()
}
