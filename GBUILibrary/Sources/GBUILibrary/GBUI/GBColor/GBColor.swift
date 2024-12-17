//
//  GBColor.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

struct GBColor: View {

    let color: Color

    init(_ color: Color = .blue) {
        self.color = color
    }

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 25, height: 25)
            .overlay(
                Circle().fill(color)
                    .frame(width: 21, height: 21)
            )
            .padding(12)
    }
}

#Preview {
    GBColor()
}
