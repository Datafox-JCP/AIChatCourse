//
//  CreateAvatarView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 18/10/25.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var avatarName = ""
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    @State private var isGenerating = false
    @State private var generatedImage: UIImage?
    @State private var isSaving = false
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                attributesSection
                imageSection
                saveSection
            }
            .navigationTitle("Crear Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if #available(iOS 26.0, *) {
                        Button(role: .close) {
                            onBackButtonPressed()
                        }
                    } else {
                        backButton
                    }
                }
            }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton(.plain) {
                onBackButtonPressed()
            }
    }
    
    private var nameSection: some View {
        Section {
            TextField("Jugador 1", text: $avatarName)
        } header: {
            Text("Nombre del avatar*")
        }
    }
    
    private var attributesSection: some View {
        Section {
            Picker(
                selection: $characterOption) {
                    ForEach(CharacterOption.allCases, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                            .tag(option)
                    }
                } label: {
                    Text("es...")
                }
            
            Picker(
                selection: $characterAction) {
                    ForEach(CharacterAction.allCases, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                            .tag(option)
                    }
                } label: {
                    Text("está...")
                }
            
            Picker(
                selection: $characterLocation) {
                    ForEach(CharacterLocation.allCases, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                            .tag(option)
                    }
                } label: {
                    Text("en...")
                }

        } header: {
            Text("Características")
        }
    }
    
    private var imageSection: some View {
        Section {
            HStack(alignment: .top, spacing: 8) {
                ZStack {
                    Text("Generar imagen")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton(.plain) {
                            onGenerateImagePressed()
                        }
                        .opacity(isGenerating ? 0 : 1)
                    
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                .disabled(isGenerating || avatarName.isEmpty)
                
                Circle()
                    .fill(.secondary.opacity(0.3))
                    .overlay {
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                    }
                    .clipShape(Circle())
            }
        }
    }
    
    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                title: "Guardar") {
                    onSavePressed()
                }
                .removeListRowFormatting()
                .padding(.top, 24)
                .opacity(generatedImage == nil ? 0.5 : 1.0)
                .disabled(generatedImage == nil)
        }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private func onGenerateImagePressed() {
        isGenerating = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            generatedImage = UIImage(systemName: "star.fill")
            
            isGenerating = false
        }
    }
    
    private func onSavePressed() {
        isSaving = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            
            dismiss()
            isSaving = false
        }
    }
}

#Preview {
    CreateAvatarView()
}
