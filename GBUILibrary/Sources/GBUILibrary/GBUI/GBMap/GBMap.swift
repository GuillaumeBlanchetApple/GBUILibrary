//
//  GBMap.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 09/12/2024.
//

import MapKit
import SwiftUI

public struct GBMap: View {

    public var body: some View {
        if #available(iOS 17.0, *) {
            Map()
                .frame(
                    height: 250,
                    alignment: .leading
                )
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal)
        } else {
            // Fallback on earlier versions
            Text("Ce service n'est pas disponible pour votre version d'iOS")
        }
    }
}

#Preview {
    GBMap()
}
