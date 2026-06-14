//
// Project: YTEmbedExample2
// File: YoutubeEmbedView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI
import WebKit

struct YoutubeEmbedView: UIViewRepresentable {
    
    let videoID: String?
    let playlistID: String?
    
    // MARK: - Create WebView
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        
        return webView
    }
    
    // MARK: - Update WebView
    func updateUIView(_ webView: WKWebView, context: Context) {
        var html: String = ""
        
        if let playlistID = playlistID {
            let cleanID = sanitizeID(playlistID)
            
            html = makeEmbedHTML(
                src: "https://www.youtube-nocookie.com/embed/videoseries?list=\(cleanID)&playsinline=1&modestbranding=1&rel=0&enablejsapi=1&origin=https://www.youtube-nocookie.com"
            )
            
        } else if let videoID = videoID {
            let cleanID = sanitizeID(videoID)
            
            html = makeEmbedHTML(
                src: "https://www.youtube-nocookie.com/embed/\(cleanID)?playsinline=1&modestbranding=1&rel=0&enablejsapi=1&origin=https://www.youtube-nocookie.com"
            )
            
        } else {
            html = "<html><body><p>No video selected.</p></body></html>"
        }
        
        webView.loadHTMLString(html, baseURL: URL(string: "https://www.youtube-nocookie.com"))
    }
    
    // MARK: - Helper: Clean "VIDEO_ID?si=xyz"
    private func sanitizeID(_ raw: String) -> String {
        raw.components(separatedBy: ["?", "&"]).first ?? raw
    }
    
    // MARK: - Helper: Build Responsive HTML
    private func makeEmbedHTML(src: String) -> String {
        """
        <html>
        <head>
            <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        </head>
        <body style="margin:0; padding:0; background:black;">
            <iframe
                width="100%"
                height="100%"
                src="\(src)"
                frameborder="0"
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
            </iframe>
        </body>
        </html>
        """
    }
}
