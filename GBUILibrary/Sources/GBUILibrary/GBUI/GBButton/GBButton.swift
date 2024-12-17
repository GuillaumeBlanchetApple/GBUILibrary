//
//  GBButton.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 10/10/2024.
//

import SwiftUI

public struct GBButton: View {

    let title: String
    let colorTheme: Color?
    let action: () -> Void

    public init(title: String, colorTheme: Color? = nil, action: @escaping () -> Void) {
        self.title = title
        self.colorTheme = colorTheme
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .fillHorizontaly()
                .foregroundColor(.white)
                .background(colorTheme ?? Color.blue)
                .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}

#Preview {
    GBButton(title: "Test tres tres tres long", colorTheme: .blue) {}
}
