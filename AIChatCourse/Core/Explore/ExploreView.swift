//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 30/09/25.
//

import SwiftUI

struct ExploreView: View {
    
    let avatar = AvatarModel.mock
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
            } // List
            .navigationTitle("Explorar")
        } // Nav
    }
    
    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(items: featuredAvatars) { avatar in
                    HeroCellView(
                        title: avatar.name,
                        subTitle: avatar.characterDescription,
                        imageName: avatar.profileImageName
                    )
                } // Carousel View
            } // ZStack
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatars")
        } // Section
    }
    
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(
                                title: category.rawValue.capitalized,
                                imageName: Constants.randomImage
                            )
                        }
                    } // HStack
                } // Scroll
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            } // ZStack
            .removeListRowFormatting()
        } header: {
            Text("Categories")
        } // Section
    }
}

#Preview {
    ExploreView()
}
