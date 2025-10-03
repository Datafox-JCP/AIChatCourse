//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 01/10/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignedOutPressed()
                } label: {
                    Text("Cerrar sesión")
                }
            }
            .navigationTitle("Ajustes")
        }
    }
    
    func onSignedOutPressed() {
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
