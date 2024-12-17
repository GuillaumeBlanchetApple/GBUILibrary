//
//  GBTextfield.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

public enum TextFieldType {
    case vanilla
    case password
    case email
}

public struct GBTextfield: View {

    private let type: TextFieldType
    private let placeholder: String?
    @State private var textInput: String = ""

    public init(type: TextFieldType, placeholder: String?, textInput: String) {
        self.type = type
        self.placeholder = placeholder
        self.textInput = textInput
    }

    public var body: some View {
        VStack {
            if type == .password {
                SecureField(placeholder ?? "", text: $textInput)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                TextField(placeholder ?? "", text: $textInput)
                    .keyboardType(type == .email ? .emailAddress : .default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        GBTextfield(
            type: .vanilla,
            placeholder: "Placeholder",
            textInput: "Text"
        )
        GBTextfield(
            type: .password,
            placeholder: "Entrez votre mot de passe",
            textInput: "Text"
        )
        GBTextfield(
            type: .email,
            placeholder: "Placeholder",
            textInput: "Text"
        )
    }
}
