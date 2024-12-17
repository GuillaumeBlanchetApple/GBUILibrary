//
//  GBScrollView.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

public struct GBScrollView: View {

    var axis: Axis.Set
    var elements: [GBAnyView]

    public init(axis: Axis.Set, elements: [GBAnyView]) {
        self.axis = axis
        self.elements = elements
    }

    public var body: some View {
        ScrollView(axis, showsIndicators: axis == .vertical) {
            content()
        }
    }

    @ViewBuilder
    private func content() -> some View {
        if axis == .horizontal {
            HStack(spacing: 16) {
                buildElements()
                    .padding(.vertical)
            }
            .frame(maxHeight: 280)
        } else {
            VStack(spacing: 16) {
                buildElements()
            }
        }
    }

    private func buildElements() -> some View {
        ForEach(0..<elements.count, id: \.self) { index in
            elements[index]
        }
    }
}

#Preview {
    GBScrollView(axis: .vertical, elements: [
        .init(type: .bigTitle("Title")),
        .init(type: .cell(nil, "Title", "subtitle", .none)),
        .init(type: .cell(nil, "Title", "subtitle", .color(.red))),
        .init(type: .cell(nil, "Title", "subtitle", .tag("blabla", .green))),
        .init(type: .cell(nil, "Title", "subtitle", .both("blabla", .blue))),
        .init(type: .media("hq_ZR_7U7rY", 400)),
        .init(type: .button("Button", .green, {}))
    ])
}
