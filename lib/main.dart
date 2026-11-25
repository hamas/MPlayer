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
        // dynamic_color 2.x uses the independently versioned Material UI
        // ColorScheme. Re-seed Flutter's ColorScheme at this package boundary.
        final systemLightScheme = lightDynamic == null
            ? null
            : ColorScheme.fromSeed(seedColor: lightDynamic.primary);
        final systemDarkScheme = darkDynamic == null
            ? null
            : ColorScheme.fromSeed(
                seedColor: darkDynamic.primary,
                brightness: Brightness.dark,
              );

        final lightScheme = albumColorScheme ?? systemLightScheme;
        final darkScheme = albumColorScheme != null
            ? ColorScheme.fromSeed(
                seedColor: albumColorScheme.primary,
                brightness: Brightness.dark,
              )
            : systemDarkScheme;

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
