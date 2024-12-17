//
//  GBTag.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

struct GBTag: View {

    let title: String
    let color: Color

    init(title: String, color: Color?) {
        self.title = title
        self.color = color ?? .blue
    }

    var body: some View {
        Text(title)
            .padding(8)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(12)
    }
}

#Preview {
    GBTag(title: "Hello, World!", color: .red)
}
