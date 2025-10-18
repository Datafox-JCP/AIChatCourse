//
//  CreateAccountView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 17/10/25.
//

import SwiftUI
internal import AuthenticationServices

struct CreateAccountView: View {
    
    var title = "Crear Cuenta"
    var subtitle = "¡No pierdas tus datos! Conectarse a un proveedor SSO para guardar tu cuenta."
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SignInWithAppleButtonView(
                type: .signIn,
                style: .black,
                cornerRadius: 10
            )
            .frame(height: 55)
            .anyButton(.press) {
                
            }
            
            Spacer()
            
        }
        .padding(16)
        .padding(.top, 40)
    }
}

#Preview {
    CreateAccountView()
}

private struct SignInWithAppleButtonView: View {
    public let type: ASAuthorizationAppleIDButton.ButtonType
    public let style: ASAuthorizationAppleIDButton.Style
    public let cornerRadius: CGFloat

    public init(
        type: ASAuthorizationAppleIDButton.ButtonType = .signIn,
        style: ASAuthorizationAppleIDButton.Style = .black,
        cornerRadius: CGFloat = 10
    ) {
        self.type = type
        self.style = style
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        ZStack {
            Color.black.opacity(0.001)

            SignInWithAppleButtonViewRepresentable(type: type, style: style, cornerRadius: cornerRadius)
                .disabled(true)
        }
    }
}

private struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable {
    let type: ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    let cornerRadius: CGFloat

    func makeUIView(context: Context) -> some UIView {
        let button = ASAuthorizationAppleIDButton(type: type, style: style)
        button.cornerRadius = cornerRadius
        return button
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeCoordinator() {

    }
}

#Preview("SignInWithAppleButtonView") {
    VStack(spacing: 4) {
        SignInWithAppleButtonView(
            type: .signUp,
            style: .black,
            cornerRadius: 10
        )
        .frame(height: 50)
    }
    .padding(40)
}
