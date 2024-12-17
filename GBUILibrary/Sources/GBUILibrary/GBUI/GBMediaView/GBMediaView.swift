//
//  GBPlayerView.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 11/10/2024.
//

import SwiftUI
import WebKit

public struct GBMediaView: UIViewRepresentable {

    enum MediaType {
        case youtube, dm, x
    }

    let mediaID: String
    let mediaType: MediaType


    public func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let mediaUrl = prepareUrl() else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: mediaUrl))
    }

    func prepareUrl() -> URL? {
        switch mediaType {
            case .youtube:
                guard let youtubeUrl = URL(string: "https://www.youtube.com/embed/\(mediaID)") else {
                    return nil
                }
                return youtubeUrl
            case .dm:
                guard let dmUrl = URL(string: "https://www.dai.ly/\(mediaID)") else {
                    return nil
                }
                return dmUrl
            case .x:
                guard let xUrl = URL(string: "https://x.com/MacGeneration/status/\(mediaID)?s=20") else {
                    return nil
                }
                return xUrl
        }
    }
}
