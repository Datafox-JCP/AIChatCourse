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
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection
                
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
                    .anyButton(.plain) {
                        
                    }
                } // Carousel View
            } // ZStack
            .removeListRowFormatting()
        } header: {
            Text("Destacados")
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
                            .anyButton(.plain) {
                                
                            }
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
            Text("Cetegorías")
        } // Section
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName!,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight) {
                    
                }
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")
        } // Section
    }
}

#Preview {
    ExploreView()
}
