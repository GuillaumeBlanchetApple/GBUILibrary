//
//  GBMediaContainer.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI

public struct GBMediaContainer: View {

    let mediaID: String
    let height: CGFloat

    public init(mediaID: String, height: CGFloat = 400) {
        self.mediaID = mediaID
        self.height = height
    }

    public var body: some View {
        GBMediaView(mediaID: mediaID, mediaType: .youtube)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .cornerRadius(16)
            .shadow(radius: 5)
            .frame(height: height)
            .padding(.horizontal)
    }
}

#Preview {
    GBMediaContainer(mediaID: "hq_ZR_7U7rY", height: 400)
}
