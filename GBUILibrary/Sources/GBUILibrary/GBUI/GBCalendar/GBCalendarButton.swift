//
//  GBCalendarButton.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 28/10/2024.
//

import SwiftUI

struct GBCalendarButton: View {

    let title: String
    let color: Color
    let isEnabled: Bool
    let isSelected: Binding<Bool>
    let action: () -> Void

    init(
        title: String,
        color: Color?,
        isEnabled: Bool = false,
        isSelected: Binding<Bool> = .constant(false),
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.color = color ?? .blue
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(8)
                .foregroundColor(isSelected.wrappedValue ? .white : color)
                .background(isSelected.wrappedValue ? color : .clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color, lineWidth: isSelected.wrappedValue ? 0 : 3)
                )
                .cornerRadius(8)
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    GBCalendarButton(title: "Hello, World!", color: .red)
    GBCalendarButton(title: "Hello, World!", color: .red, isSelected: .constant(true))
}
