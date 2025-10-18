//
//  AsyncCallToActionButton.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 18/10/25.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    var isLoading = false
    var title = "Guardar"
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text("Terminar")
            }
        }
        .callToActionButton()
        .anyButton(.press) {
            action()
        }
        .disabled(isLoading)
    }
}

private struct PreviewView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        AsyncCallToActionButton(
            isLoading: isLoading,
            title: "Terminar",
            action: {
                isLoading = true
                
                Task {
                    try? await Task.sleep(for: .seconds(3))
                    isLoading = false
                }
            }
        )
    }
}

#Preview {
    PreviewView()
        .padding()
}
