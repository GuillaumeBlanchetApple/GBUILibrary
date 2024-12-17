//
//  View+Tools.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 10/10/2024.
//

import SwiftUI

public extension View {

    func fillHorizontaly(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .greatestFiniteMagnitude, alignment: alignment)
    }

    func fillVerticaly(alignment: Alignment = .center) -> some View {
        frame(maxHeight: .greatestFiniteMagnitude, alignment: alignment)
    }
}
