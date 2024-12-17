//
//  GBCell.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 10/10/2024.
//

import SwiftUI

public enum DifficultyBy {
    case tag(String, Color)
    case color(Color)
    case both(String, Color)
    case none
}

public struct GBCell: View {

    let image: Image
    let title: String
    let subtitle: String?
    let difficultyBy: DifficultyBy
    let colorDif: Color?
    let tag: String?
    let isTappable: Bool

    public init(
        image: Image = Image("ImageTest"),
        title: String,
        subtitle: String? = nil,
        difficultyBy: DifficultyBy,
        isTappable: Bool = true
    ) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.difficultyBy = difficultyBy
        self.isTappable = isTappable
        switch difficultyBy {
            case let .tag(tag, colorDif),
                let .both(tag, colorDif):
                self.colorDif = colorDif
                self.tag = tag
            case let .color(colorDif):
                self.colorDif = colorDif
                self.tag = nil
            case .none:
                self.colorDif = nil
                self.tag = nil
        }
    }

    public var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .topTrailing) {
                    image
                        .resizable()
                        .scaledToFit()
                    switch difficultyBy {
                        case .tag(let title, let color):
                            HStack {
                                GBTag(title: title, color: color)
                            }
                        case .color(let color):
                            HStack {
                                GBColor(color)
                            }
                        case .both(let title, let color):
                            HStack {
                                GBColor(color)
                                GBTag(title: title, color: color)
                            }
                        case .none:
                            HStack {}
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding(
                    EdgeInsets(
                        top: 8,
                        leading: 16,
                        bottom: 16,
                        trailing: 16
                    )
                )
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 5)
        }
        .disabled(!isTappable)
        .padding(.horizontal)
    }
}

#Preview {
    GBCell(title: "Title", subtitle: "Subtitle", difficultyBy: .color(.red))
}
