//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    @State private var isCompletingProfileSetup = false
    
    var selectedColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("¡Configuración Lista!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("Se ha configurado su perfil y está listo para chatear.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private var ctaButton: some View {
        ZStack {
            if isCompletingProfileSetup {
                ProgressView()
                    .tint(.white)
            } else {
                Text("Terminar")
            }
        }
        .callToActionButton()
        .anyButton(.press) {
            onFinishButtonPressed()
        }
        .disabled(isCompletingProfileSetup)
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
