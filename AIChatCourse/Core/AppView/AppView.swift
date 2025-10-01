//
//  AppView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("showTabbarView") var showTabBar = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar) {
                TabBarView()
            } onboardingView: {
                WelcomeView()
            }
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}

#Preview("Onboarding - Tabbar") {
    AppView(showTabBar: false)
}
