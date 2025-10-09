//
//  ImageLoaderView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 01/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
       Rectangle()
            .opacity(0.0001)
            .overlay(
                WebImage(url: URL(string: urlString))
                 .resizable()
                 .indicator(.activity)
                 .aspectRatio(contentMode: resizingMode)
                )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 300, height: 400)
}
