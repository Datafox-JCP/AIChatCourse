//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Welcome to the Chat App")
                .frame(maxHeight: .infinity)
            
            Button {
                // Finish onboarding and enter app
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
    
    func onFinishButtonPressed() {
        // Other logic
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
