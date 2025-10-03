//
//  OnboardingIntroView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 02/10/25.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("¡Crea tus propios ")
                +
                Text("avatares")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text(" y chatea con ellos!\n\n")
                +
                Text("Conversaciones reales ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("con respuestas generadas por IA")
            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(24)
            
            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continuar")
                    .callToActionButton()
            }
        }
        .padding(24)
        .font(.title3)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
