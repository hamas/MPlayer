import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingsScreen extends ConsumerStatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  ConsumerState<ThemeSettingsScreen> createState() =>
      _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends ConsumerState<ThemeSettingsScreen> {
  bool _blackMode = false;
  bool _materialYouOverride = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Studio')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('True AMOLED Black'),
            subtitle: const Text(
              'Use pure black background instead of dark grey in dark mode',
            ),
            value: _blackMode,
            onChanged: (val) {
              setState(() => _blackMode = val);
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Override Material You'),
            subtitle: const Text(
              'Force a specific seed color instead of system wallpaper',
            ),
            value: _materialYouOverride,
            onChanged: (val) {
              setState(() => _materialYouOverride = val);
            },
          ),
          if (_materialYouOverride)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _ColorSwatch(Colors.deepPurple, 'Purple'),
                  _ColorSwatch(Colors.pink, 'Pink'),
                  _ColorSwatch(Colors.teal, 'Teal'),
                  _ColorSwatch(Colors.blue, 'Blue'),
                  _ColorSwatch(Colors.orange, 'Orange'),
                ],
              ),
            ),
          const Divider(),
          ListTile(
            title: const Text('App Icon'),
            subtitle: const Text('Change the launcher icon (Requires restart)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Icon picker not implemented yet.'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;
  final String name;

  const _ColorSwatch(this.color, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
