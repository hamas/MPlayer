import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/youtube/logic/youtube_auth_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserLoginScreen extends ConsumerStatefulWidget {
  const BrowserLoginScreen({super.key});

  @override
  ConsumerState<BrowserLoginScreen> createState() => _BrowserLoginScreenState();
}

class _BrowserLoginScreenState extends ConsumerState<BrowserLoginScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.0.0 Safari/537.36",
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://music.youtube.com'));
  }

  Future<void> _extractCookiesAndClose() async {
    try {
      // Evaluate javascript to get the document.cookie
      // `runJavaScriptReturningResult` correctly returns a string with quotes in some implementations,
      final Object result = await _controller.runJavaScriptReturningResult(
        'document.cookie',
      );
      String cookieString = result.toString();

      // Remove enclosing quotes if present (webview_flutter sometimes returns '"cookie"')
      if (cookieString.startsWith('"') && cookieString.endsWith('"')) {
        cookieString = cookieString.substring(1, cookieString.length - 1);
      }

      if (cookieString.contains('SAPISID') ||
          cookieString.contains('__Secure-3PAPISID')) {
        await ref.read(youtubeAuthProvider.notifier).saveCookies(cookieString);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Connected to YouTube Music successfully!'),
            ),
          );
          Navigator.of(context).pop();
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Could not find login cookies. Make sure you are signed in.',
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error extracting cookies: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect YouTube Account'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _extractCookiesAndClose,
            child: const Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading) const LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

/// Helper method to show this as a modal bottom sheet
Future<void> showYouTubeLoginModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const BrowserLoginScreen(),
  );
}
