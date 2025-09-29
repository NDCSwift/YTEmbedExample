//
// Project: YTEmbedExample2
// File: YoutubeEmbedView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding97
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI
import WebKit

// A SwiftUI wrapper for WKWebView to embed YouTube videos and playlists
struct YoutubeEmbedView: UIViewRepresentable {
    let videoID: String? // YouTube video ID (not the full URL)
    let playlistID: String? // YouTube playlist ID
    
    // Creates the WKWebView instance
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView() // Initialize WKWebView
        webView.scrollView.isScrollEnabled = false // Disable scrolling
        return webView
    }
    
    // Loads the YouTube video or playlist into the web view
    func updateUIView(_ webView: WKWebView, context: Context) {
        let embedHTML: String // Holds the HTML string for embedding

        if let playlistID = playlistID {
            // Embed a full YouTube playlist
            embedHTML = """
            <html>
            <body style="margin: 0; padding: 0;">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/videoseries?list=\(playlistID)" frameborder="0" allowfullscreen> </iframe>
            </body>
            </html>
            """
        } else if let videoID = videoID {
            // Embed a single YouTube video
            embedHTML = """
            <html>
            <body style="margin: 0; padding: 0;">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/\(videoID)?playsinline=1" frameborder="0" allowfullscreen> </iframe>
            </body>
            </html>
            """
        } else {
            // Display a message if no video or playlist is selected
            embedHTML = "<html><body><p> No video or playlist is selected </p></body></html>"
        }
        
        webView.loadHTMLString(embedHTML, baseURL: nil) // Load the HTML string into the web view
    }
}
