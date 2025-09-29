//
// Project: YTEmbedExample2
// File: YouTubeDetailView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding97
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI

// View to display details of a selected YouTube video
struct YouTubeDetailView: View {
    let video: YouTubeVideo // Selected video
    
    var body: some View {
        VStack {
            Text(video.title) // Display video title
                .font(.title) // Set font size
                .bold() // Make text bold
                .padding() // Add padding around title
            
            YoutubeEmbedView(videoID: video.videoID, playlistID: nil) // Embed YouTube video
                .frame(height: 250) // Set video frame height
            
            Button(action: openYouTubeApp) { // Button to open video in YouTube app
                Label("Watch on YouTube", systemImage: "play.circle.fill") // Button label with icon
                    .foregroundStyle(.blue) // Set text color to blue
                    .font(.title2) // Set font size
            }
            
            Spacer() // Push content to the top
        }
        .navigationTitle("Playing Video") // Set navigation bar title
        .navigationBarTitleDisplayMode(.inline) // Display title in inline mode
    }
    
    // Function to open YouTube video in YouTube app or Safari
    private func openYouTubeApp() {
        let url = URL(string: "youtube://www.youtube.com/watch?v=\(video.videoID)")! // YouTube app URL scheme
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) // Open in YouTube app if installed
        } else {
            UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=\(video.videoID)")!) // Open in Safari if app isn't installed
        }
    }
}
