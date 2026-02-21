import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/core/theme/app_theme.dart';
import 'package:mplayer/core/theme/theme_provider.dart';
import 'package:mplayer/features/home/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MPlayerApp()));
}

class MPlayerApp extends ConsumerWidget {
  const MPlayerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumColorSchemeAsync = ref.watch(dynamicColorSchemeProvider);
    final albumColorScheme = albumColorSchemeAsync.value;

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final lightScheme = albumColorScheme ?? lightDynamic;
        final darkScheme = albumColorScheme != null
            ? ColorScheme.fromSeed(
                seedColor: albumColorScheme.primary,
                brightness: Brightness.dark,
              )
            : darkDynamic;

        return MaterialApp(
          title: 'MPlayer',
          theme: AppTheme.lightTheme(lightScheme),
          darkTheme: AppTheme.darkTheme(darkScheme),
          themeMode: ThemeMode.system,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
