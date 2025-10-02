//
//  View+Ext.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 16))
    }
}
