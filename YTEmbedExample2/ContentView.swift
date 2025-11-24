//
// Project: YTEmbedExample2
// File: ContentView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding97
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI
import WebKit

// Represents a single YouTube video item
struct YouTubeVideo: Identifiable {
    let id = UUID() // Unique identifier for each video
    let title: String // Video title
    let videoID: String // Unique YouTube video ID
}

// Represents a YouTube playlist item
struct YouTubePlaylist: Identifiable {
    let id = UUID() // Unique identifier for each playlist
    let title: String // Playlist title
    let playlistID: String // Unique YouTube playlist ID
}

// Stores a list of YouTube playlists
struct YouTubePlaylistList {
    static let playlists = [
        YouTubePlaylist(title: "Swift UI Videos", playlistID: "PLbeGXTt3IOd9-PMvAvpwTOXfV3T8h6jfM&si=FwqwXVG9O1qTnQdz"),
        YouTubePlaylist(title: "Developer Tutorials", playlistID: "PLbeGXTt3IOd_ofjQ5wBo-rsvX7KisFE5D&si=ja-lxQ589aW9GLdW")
    ]
}

// Stores a list of individual YouTube videos
struct YouTubeVideoList {
    static let videos = [
        YouTubeVideo(title: "New Coders Start Here", videoID: "YkCU3SQcN5I"),
        YouTubeVideo(title: "SwiftUI Navigation & TabView: The Ultimate Guide", videoID: "m8KvqS7VMZs?si=qOVaVX8b_8Na2KDw"),
        YouTubeVideo(title: "SwiftUI Building a Health App with HealthKit", videoID: "ORJ9rvqoR9s?si=gLzZfOW2oARYYLq7")
    ]
}

// Main content view displaying lists of videos and playlists
struct ContentView: View {
    let videos = YouTubeVideoList.videos // Retrieve list of videos
    let playlists = YouTubePlaylistList.playlists // Retrieve list of playlists
    
    var body: some View {
        NavigationStack { // Provides a navigation interface
            
            // List displaying YouTube videos
            List(videos) { video in
                NavigationLink(destination: YouTubeDetailView(video: video)) { // Navigates to video detail view
                    HStack { // Horizontal stack for video list item layout
                        Image(systemName: "play.square.fill") // Play button icon
                            .foregroundStyle(.red) // Red color for icon
                            .font(.largeTitle) // Large icon size
                        VStack(alignment: .leading) { // Stack for video title and description
                            Text(video.title)
                                .font(.headline) // Bold title text
                            Text("Tap to watch")
                                .foregroundStyle(.gray) // Subtitle in gray
                                .font(.subheadline) // Smaller font for subtitle
                        }
                    }
                }
            }
            
            // List displaying YouTube playlists
            List(playlists) { playlist in
                NavigationLink(destination: YouTubePlaylistDetailView(playlist: playlist)) { // Navigates to playlist detail view
                    HStack { // Horizontal stack for playlist list item layout
                        Image(systemName: "play.square.fill") // Play button icon
                            .foregroundStyle(.red) // Red color for icon
                            .font(.largeTitle) // Large icon size
                        VStack(alignment: .leading) { // Stack for playlist title and description
                            Text(playlist.title)
                                .font(.headline) // Bold title text
                            Text("Tap to watch Playlist")
                                .foregroundStyle(.gray) // Subtitle in gray
                                .font(.subheadline) // Smaller font for subtitle
                        }
                    }
                }
            }
            
            .navigationTitle("YouTube Videos") // Title for the navigation bar
        }
    }
}

// Preview provider for SwiftUI preview canvas
#Preview {
    ContentView()
}
