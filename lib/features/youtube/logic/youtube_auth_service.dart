import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final youtubeAuthProvider = NotifierProvider<YouTubeAuthNotifier, bool>(() {
  return YouTubeAuthNotifier();
});

class YouTubeAuthNotifier extends Notifier<bool> {
  static const _storage = FlutterSecureStorage();
  static const _cookieKey = 'youtube_auth_cookies';

  @override
  bool build() {
    _init();
    return false;
  }

  Future<void> _init() async {
    final cookies = await _storage.read(key: _cookieKey);
    // If we have cookies saved, we assume the user is logged in
    state = cookies != null && cookies.isNotEmpty;
  }

  /// Saves the full cookie string from the WebView
  Future<void> saveCookies(String cookieString) async {
    await _storage.write(key: _cookieKey, value: cookieString);
    state = true;
  }

  /// Retrieves the saved cookies to inject into HTTP requests
  Future<String?> getCookies() async {
    return await _storage.read(key: _cookieKey);
  }

  /// Clears the cookies, effectively logging out the user
  Future<void> clearCookies() async {
    await _storage.delete(key: _cookieKey);
    state = false;
  }
}
