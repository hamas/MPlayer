# MPlayer

MPlayer is a cutting-edge, open-source music player developed in 100% **Dart** using the **Flutter** framework. It is designed to be the ultimate audio experience for Android and beyond, offering a pixel-perfect implementation of modern **Material 3 Expressive** design guidelines. MPlayer is a spiritual successor to PixelPlayer, re-engineered for cross-platform performance and maintainability.

![MPlayer Banner](https://via.placeholder.com/1280x640.png?text=MPlayer+Expressive+UI)

## 🚀 Features

### 🎧 Audio Experience
-   **Local Playback**: Seamlessly scans and plays audio files from device storage.
-   **Background Playback**: Robust service continues music when the app is minimized or the screen is off.
-   **Gapless Playback**: uninterrupted listening experience (Planned).
-   **Waveform Visualizer**: Real-time audio visualization on the Now Playing screen.
-   **Lyrics**: Synchronized lyrics support.

### 🎨 Material 3 Expressive UI
-   **Motion-Rich**: Fluid animations, shared element transitions, and unparalleled responsiveness.
-   **Dynamic Theming**: automatically adapts the app's color scheme to match your device's wallpaper/system theme.
-   **Expressive Layouts**: Big, bold typography and easy-to-reach controls.

### 🧠 Smart Features
-   **AI Playlists (Gemini)**: Ask for "somber music for a rainy night" and get a generated playlist instantly.
-   **Local Casting**: Built-in HTTP server allows you to cast your local files to web browsers or Chromecast devices on the same network.

## 🛠 Tech Stack

MPlayer is built with the latest and most robust Dart technologies:

*   **Language**: Dart 3.x (100% pure Dart codebase)
*   **Framework**: Flutter
*   **Architecture**: Riverpod (State Management) + Repository Pattern
*   **Database**: `drift` (Type-safe SQLite)
*   **Networking**: `retrofit` + `dio`
*   **Audio Engine**: `just_audio` + `audio_service`
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

## 🗺️ Roadmap

- [x] **Phase 1: Foundation**: Database Setup, File Scanning Logic (In Progress).
- [ ] **Phase 2: Audio Engine**: Background Service, Notification Controls.
- [ ] **Phase 3: UI Design**: Material 3 Expressive Implementation.
- [ ] **Phase 4: Advanced**: AI, Casting, Tag Editing.

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs or feature enhancements.

## 📄 License

**MPlayer** is licensed under the **GNU General Public License v3.0 (GPLv3)**.
Copyright (c) 2026 **Hamas** (hamasdmc@gmail.com).

This ensures that MPlayer remains free and open-source forever. Any modifications or distribution of this software must also remain open-source under the same terms.
