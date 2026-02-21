# MPlayer

MPlayer is a cutting-edge, open-source music player developed in 100% **Dart** using the **Flutter** framework. It is designed to be the ultimate audio experience for Android and beyond, offering a pixel-perfect implementation of modern **Material 3 Expressive** design guidelines. MPlayer is a spiritual successor to PixelPlayer, re-engineered for cross-platform performance and maintainability.

![MPlayer Banner](https://via.placeholder.com/1280x640.png?text=MPlayer+Expressive+UI)

## 🚀 Features

### 🎧 Pro Audio Experience
-   **10-Band Equalizer & Effects**: Built-in native Android EQ with Bass Boost and genre presets.
-   **Gapless & Crossfade**: Smooth audio transitions configurable up to 10 seconds.
-   **Local Playback**: Seamlessly scans and plays audio files with Isolate-backed lightning-fast indexing.
-   **Background Playback**: Robust service continues music when the app is minimized or the screen is off.
-   **Waveform Visualizer**: Real-time interactive wavy slider `WavyMusicSlider` on the Now Playing screen.

### ☁️ YouTube Music Integration ($0 Cost API-Keyless)
-   **Hybrid InnerTube Engine**: Browse and search YouTube's global catalog without needing a developer API key.
-   **Secure Authentication**: Log in to access your "Liked Songs" directly via an expressive M3 WebView.
-   **Offline Downloads**: Download directly from YouTube stream `.m4a` sources and instantly add them to your local library.

### 🎨 Material 3 Expressive UI
-   **Motion-Rich**: Fluid `flutter_animate` bouncy physics, shared element transitions, and extreme responsiveness.
-   **Dynamic Theming**: Automatically adapts the app's color scheme to match the currently playing Album Art using `palette_generator`.
-   **Expressive Layouts**: Big, bold typography and easy-to-reach UI controls.

### 🧠 Smart Features & Tools
-   **AI Playlists (Gemini)**: Ask for "somber music for a rainy night" and get a generated playlist instantly.
-   **Batch Tag Editor**: Natively overwrite raw MP3/FLAC/M4A ID3 metadata blocks directly on your local storage.
-   **Folder Exclusion**: Safely hide private audio directories like WhatsApp Voice Notes from the library scanner.
-   **Android Auto**: Fully compatible with car displays and home widgets.

## 🛠 Tech Stack

MPlayer is built with the absolute latest and most robust Dart technologies:

*   **Language**: Dart 3.x (100% pure Dart codebase)
*   **Framework**: Flutter
*   **Architecture**: Riverpod 3.x (State Management) + Feature-First (Screaming) Architecture
*   **Database**: `drift` (Type-safe SQLite with Background Isolates)
*   **Networking**: `dio` + `youtube_explode_dart` + `lrclib`
*   **Audio Engine**: `just_audio` + `audio_service` + `audio_metadata_reader`
*   **Security**: `flutter_secure_storage`
*   **AI**: `google_generative_ai` (Gemini SDK)

## 📥 Installation

### Prerequisites
-   Flutter SDK (Legacy or Stable channel, compatible with Dart 3.x)
-   Android Studio / VS Code
-   Connected Android Device or Emulator

### Build Steps

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/hamas/MPlayer.git
    cd MPlayer
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Generate Code**
    MPlayer uses code generation for JSON serialization, Riverpod providers, and the database.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App**
    ```bash
    flutter run
    ```

## 🗺️ Roadmap (100% Completed)

- [x] **Phase 1: Foundation**: Isolate-backed Drift Database, Pure Dart Scanner.
- [x] **Phase 2: Networking & Parity**: Synchronized Lyrics, Deep Folder Trees, Custom Waveform Sliders.
- [x] **Phase 3: Pro Audio**: 10-Band EQ, Bass Boost, Gapless & Crossfade, Native Batch Tag Editor.
- [x] **Phase 4: Ecosystem**: Android Auto integration, Home Screen Widgets, Gemini AI.
- [x] **Phase 5: Polish**: Dynamic Album Art Theming, Spring Animations, Storage Exclusion rules.
- [x] **Phase 6: YouTube Music**: Hybrid API-Keyless Architecture, Cookies Extraction, Offline Track Downloading.
- [x] **Phase 7: Optimization**: 100% Codebase Standardization, Outdated Package Elimination, Strict Security Audits.

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs or feature enhancements.

## 📄 License

**MPlayer** is licensed under the **GNU General Public License v3.0 (GPLv3)**.
Copyright (c) 2026 **Hamas** (hamasdmc@gmail.com).

This ensures that MPlayer remains free and open-source forever. Any modifications or distribution of this software must also remain open-source under the same terms.
