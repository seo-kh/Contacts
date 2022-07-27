//
//  ImageSelectionView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ImageSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var image: String
    let columns: [GridItem] = .init(repeating: .init(.flexible(), spacing: 10), count: 3)
    let images: [String] = [
        "person",
        "person.fill",
        "person.fill.checkmark",
        "person.circle.fill",
        "person.badge.minus",
        "shareplay",
        "person.2.fill",
        "person.wave.2",
        "person.crop.square",
        "person.text.rectangle",
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(images, id: \.self) { image in
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                        .padding()
                        .border(.tertiary, width: 1)
                        .onTapGesture {
                            self.image = image
                            dismiss()
                        }
                }
            }
        }
        .padding()
        .navigationTitle("사진 추가")
    }
}


struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView(image: .constant("hello"))
    }
}
