//
//  CategoryCellView.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 06/10/25.
//

import SwiftUI

struct CategoryCellView: View {
    
    var title = ""
    var imageName = Constants.randomImage
    var font: Font = .title2
    var cornerRaidus: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
               Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .padding(16)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingGradientBackgroundForText()
            }
            .clipShape(.rect(cornerRadius: cornerRaidus))
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        
        CategoryCellView()
            .frame(width: 300)
    }
}
