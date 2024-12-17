//
//  Untitled.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 09/12/2024.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

public struct GBQRCode: View {

    var qrValue: String = ""
    var title: String?

    public init(qrValue: String, title: String? = nil) {
        self.qrValue = qrValue
        self.title = title
    }

    public var body: some View {
        VStack {
            VStack(spacing: 16) {
                if let title = title {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                Image(uiImage: generateQRCode(from: qrValue))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .frame(maxWidth: .infinity)
            .padding(16)
        }
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding(.horizontal)
    }

    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()

        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    GBQRCode(qrValue: "Hello World", title: "This is a test")
}
