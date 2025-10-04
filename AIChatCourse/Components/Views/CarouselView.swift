//
//  CarouselView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 03/10/25.
//

import SwiftUI

struct CarouselView<Content: View, T: Hashable>: View {
    
    var items: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?
    
    var body: some View {
        VStack(spacing: 12) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .scrollTransition(
                                .interactive.threshold(.visible(0.95)),
                                transition: { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                }
                            )
                            .containerRelativeFrame(.horizontal, alignment: .center)
                            .id(item)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: items.count) { _, _ in
                updateSelectionIfNeeded()
            }
            .onAppear {
                updateSelectionIfNeeded()
            }
            
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? .accent : .secondary.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    CarouselView(items: AvatarModel.mocks) { item in
        HeroCellView(
            title: item.name,
            subTitle: item.characterDescription,
            imageName: item.profileImageName
        )
    }
    .padding()
}
