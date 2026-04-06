# ▶️ YouTube Embed Example — SwiftUI

A SwiftUI app showing how to embed YouTube videos and playlists natively inside your iOS app using `WKWebView` — no redirect to the YouTube app required.

---

## 🤔 What this is

This project shows how to embed YouTube content in a SwiftUI app using a `WKWebView` wrapper with the YouTube iFrame embed API. It includes views for playing individual videos and browsing entire playlists, all within a SwiftUI navigation structure. Use this pattern to keep users in your app when displaying video content.

## ✅ Why you'd use it

- **`YoutubeEmbedView`** — a reusable `UIViewRepresentable` wrapping `WKWebView` for YouTube iFrame embeds
- **`YouTubeDetailView`** — full-screen individual video playback
- **`YouTubePlaylistDetailView`** — browse and play playlists in-app
- **No YouTube SDK needed** — uses the standard iFrame embed API via WebView
- **In-app experience** — users never leave your app to watch video content

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/JopAJwd3iC4)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/YTEmbedExample.git
cd YTEmbedExample
```

### 2. Open in Xcode
Double-click `YTEmbedExample2.xcodeproj`.

### 3. Set Your Development Team
TARGET → Signing & Capabilities → Team

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier.

---

## 🛠️ Notes
- Ensure `Info.plist` allows network access to `youtube.com` if ATS is enabled.
- Playback works best on a physical device.

## 📦 Requirements
- Xcode 16+
- iOS 16+

📺 [Watch the guide on YouTube](https://youtu.be/JopAJwd3iC4)
