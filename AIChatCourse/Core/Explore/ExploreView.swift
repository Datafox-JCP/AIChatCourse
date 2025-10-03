//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct ExploreView: View {
    
    let avatar = AvatarModel.mock
    
    var body: some View {
        NavigationStack {
            HeroCellView(
                title: avatar.name,
                subTitle: avatar.characterDescription,
                imageName: avatar.profileImageName
            )
            .frame(height: 200)
            .navigationTitle("Explorar")
        }
    }
}

#Preview {
    ExploreView()
}
