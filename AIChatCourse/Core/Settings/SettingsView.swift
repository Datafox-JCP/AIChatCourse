//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 01/10/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignedOutPressed()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignedOutPressed() {
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
