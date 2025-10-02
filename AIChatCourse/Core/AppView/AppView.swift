//
//  AppView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct AppView: View {
    
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar) {
                TabBarView()
            } onboardingView: {
                WelcomeView()
            }
            .environment(appState)
    }
}

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("Onboarding - Tabbar") {
    AppView(appState: AppState(showTabBar: false))
}
