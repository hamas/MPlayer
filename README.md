# MPlayer

MPlayer is a cutting-edge, open-source music player developed in 100% **Dart** using the **Flutter** framework. It is designed to be the ultimate audio experience for Android and beyond, offering a pixel-perfect implementation of modern **Material 3 Expressive** design guidelines. MPlayer is a spiritual successor to PixelPlayer, deeply re-engineered for structural scalability and maintainability.

![MPlayer Banner](https://via.placeholder.com/1280x640.png?text=MPlayer+Expressive+UI)

## 🚀 Features

### 🎧 Pro Audio Experience
-   **Native Equalization**: Built-in Android EQ and Loudness Enhancer dynamically piped through the `just_audio` pipeline.
-   **Gapless & Crossfade**: Smooth audio transitions configurable up to 12 seconds in the Advanced Audio settings.
-   **Local Playback**: Seamlessly scans and plays audio files with Isolate-backed lightning-fast indexing.
-   **Synchronized Lyrics Sync**: Displays LRC synced lyrics with a built-in **Lyrics Offset Editor** to manually correct timing misalignments (+/- 100ms precision).
-   **Background Playback**: Robust `audio_service` integration continues music when the app is minimized or the screen is off.
-   **Waveform Visualizer**: Real-time interactive wavy slider `WavyMusicSlider` on the Now Playing screen.

### ☁️ YouTube Music Integration ($0 Cost API-Keyless)
-   **Hybrid InnerTube Engine**: Browse and search YouTube's global catalog without needing a developer API key via `youtube_explode_dart`.
-   **Secure Authentication**: Log in to access your "Liked Songs" directly via an expressive M3 WebView.
-   **Offline Downloads**: Download directly from YouTube stream `.m4a` sources and instantly add them to your local library.

### 📊 Deep Analytics & AI
-   **Statistics Hub**: Tracks total listening time, skipping habits, and extracts your top played tracks directly from the local `drift` database.
-   **AI Music Persona**: Uses the **Gemini 1.5 Flash** SDK (`google_generative_ai`) to analyze your playback history and synthesize a customized "Music Persona".
-   **AI Playlists**: Ask for "somber music for a rainy night" and get a generated local playlist instantly via Gemini.

### 🎨 Material 3 Expressive UI
-   **Motion-Rich**: Fluid `flutter_animate` bouncy physics, shared element transitions, and extreme responsiveness.
-   **Dynamic Theming**: Automatically adapts the app's color scheme to match the currently playing Album Art using `palette_generator`.
-   **Advanced Theme Studio**: Override the Material You wallpaper seed with custom swatches, and force True AMOLED Black mode instead of standard dark grey.

### 🧠 Smart Tools
-   **Batch Tag Editor**: Natively overwrite raw MP3/FLAC/M4A ID3 metadata blocks directly on your local storage.
-   **Folder Exclusion**: Safely hide private audio directories (like WhatsApp Voice Notes) from the library scanner.
-   **Android Auto**: Fully compatible with car displays and home widgets.

## 🛠 Tech Stack & Architecture

### Dependency Matrix
MPlayer is built with the absolute latest and most robust Dart technologies:
*   **Language**: Dart ^3.8.0 (100% pure Dart codebase)
*   **Framework**: Flutter (Stable)
*   **State Management**: `flutter_riverpod` (^3.2.1) + `riverpod_annotation`
*   **Database**: `drift` (^2.31.0) with Background Isolates via `sqlite3_flutter_libs`
*   **Networking**: `dio` (^5.9.1) + `chopper` (^8.5.0) for internal apis, `youtube_explode_dart` for YT.
*   **Audio Engine**: `just_audio` (^0.10.5) + `audio_service`
*   **Security**: `flutter_secure_storage` (^10.0.0)
*   **AI**: `google_generative_ai` (^0.4.7)

### Feature-First (Screaming) Architecture
The project strictly enforces a highly scalable structured blueprint:
- `lib/core/`: Global agnostic setup (Drift configs, Material 3 AppTheme, HTTP clients).
- `lib/features/`: The screaming domains (`audio`, `library`, `stats`, `settings`, `youtube`). 
   - Each feature encapsulates its own `ui/`, `logic/`, and `models/`.
- `lib/presentation/`: Cross-feature UI constants and generic widgets.

## 📥 Installation

### Prerequisites
-   Flutter SDK (Compatible with Dart 3.8+)
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
    MPlayer uses active code generation for JSON serialization (`freezed`), Riverpod providers, and the Drift database schema.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App**
    ```bash
    flutter run
    ```
    *(Note: To test Gemini AI features, you must safely inject your personal API key via the in-app Advanced Settings hub).*

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs or feature enhancements.

## 📄 License

**MPlayer** is licensed under the **GNU General Public License v3.0 (GPLv3)**.
Copyright (c) 2026 **Hamas** (hamasdmc@gmail.com).

This ensures that MPlayer remains free and open-source forever. Any modifications or distribution of this software must also remain open-source under the same terms.
