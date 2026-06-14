//
// Project: YTEmbedExample2
// File: YouTubePlaylistDetailView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI

// View to display details of a selected YouTube playlist
struct YouTubePlaylistDetailView: View {
    let playlist: YouTubePlaylist // Selected playlist
    
    var body: some View {
        VStack {
            Text(playlist.title) // Display playlist title
                .font(.title) // Set font size
                .bold() // Make text bold
                .padding() // Add padding around title
            
            YoutubeEmbedView(videoID: nil, playlistID: playlist.playlistID) // Embed the selected playlist
                .frame(height: 250) // Set frame height for embedded playlist
            
            Spacer() // Push content to the top
        }
        .navigationTitle("Playing playlists") // Set navigation bar title
        .navigationBarTitleDisplayMode(.inline) // Display title in inline mode
    }
}
