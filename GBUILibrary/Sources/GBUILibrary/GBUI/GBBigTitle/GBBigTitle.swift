//
//  GBBigTitle.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

public struct GBBigTitle: View {

    public let title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    GBBigTitle(title: "Hello, World!")
}
