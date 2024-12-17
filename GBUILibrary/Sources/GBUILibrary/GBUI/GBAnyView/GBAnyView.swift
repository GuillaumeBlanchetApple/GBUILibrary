//
//  GBAnyView.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

@available(iOS 16.0, *)
public struct GBAnyView: View {

    public let type: TypeView

    public init(type: TypeView) {
        self.type = type
    }

    public enum TypeView {
        case bigTitle(String)
        case button(String, Color?, () -> Void)
        case calendar
        case cell(Image?, String, String?, DifficultyBy)
        case map
        case media(String, CGFloat)
        case qrCode(String, String?)
        case scrollView(Axis.Set, [GBAnyView])
        case textfield(TextFieldType, String?, String)
    }

    public var body: some View {
        switch type {
            case .bigTitle(let title):
                GBBigTitle(title: title)
            case .button(let title, let color, let action):
                GBButton(title: title, colorTheme: color, action: action)
            case .calendar:
                GBCalendar()
            case .cell(let image, let title, let subtitle, let difficultyBy):
                if let image {
                    GBCell(image: image, title: title, subtitle: subtitle, difficultyBy: difficultyBy)
                } else {
                    GBCell(title: title, subtitle: subtitle, difficultyBy: difficultyBy)
                }
            case .map:
                GBMap()
            case .media(let id, let height):
                GBMediaContainer(mediaID: id, height: height)
            case .qrCode(let qrValue, let title):
                GBQRCode(qrValue: qrValue, title: title)
            case .scrollView(let axis, let content):
                GBScrollView(axis: axis, elements: content)
            case .textfield(let type, let placeholder, let textInput):
                GBTextfield(type: type, placeholder: placeholder, textInput: textInput)
        }
    }
}
