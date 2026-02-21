import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:mplayer/features/server/logic/server_provider.dart';
import 'package:mplayer/features/settings/logic/settings_provider.dart';
import 'package:mplayer/features/settings/logic/settings_repository.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _apiKeyController = TextEditingController();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    // Load initial key
    ref
        .read(settingsRepositoryProvider)
        .getSetting(SettingsRepository.geminiApiKey)
        .then((value) {
          if (value != null) {
            _apiKeyController.text = value;
          }
        });
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serverStatus = ref.watch(serverStatusProvider);
    final localServer = ref.watch(localServerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Local Server Section
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Local HTTP Server'),
                  subtitle: Text(serverStatus ? 'Running' : 'Stopped'),
                  trailing: Switch(
                    value: serverStatus,
                    onChanged: (val) {
                      ref.read(serverStatusProvider.notifier).toggle();
                    },
                  ),
                ),
                if (serverStatus && localServer.url != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Server Address:',
                          style: theme.textTheme.labelLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                localServer.url!,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: localServer.url!),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Address copied to clipboard',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Open this URL in a browser on another device to play your music.',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Library Settings Section
          const Text(
            'Library',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              title: const Text('Excluded Folders'),
              subtitle: const Text('Manage folders ignored during scan'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const _ExcludedFoldersScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Gemini AI Section
          const Text(
            'Gemini AI',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('API Key'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _apiKeyController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your Gemini API Key',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        final key = _apiKeyController.text.trim();
                        if (key.isNotEmpty) {
                          await ref
                              .read(settingsRepositoryProvider)
                              .saveSetting(
                                SettingsRepository.geminiApiKey,
                                key,
                              );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('API Key saved')),
                            );
                          }
                        }
                      },
                      child: const Text('Save Key'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Launch URL to get key
                    },
                    child: const Text('Where do I get an API Key?'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExcludedFoldersScreen extends ConsumerStatefulWidget {
  const _ExcludedFoldersScreen();

  @override
  ConsumerState<_ExcludedFoldersScreen> createState() =>
      _ExcludedFoldersScreenState();
}

class _ExcludedFoldersScreenState
    extends ConsumerState<_ExcludedFoldersScreen> {
  final _pathController = TextEditingController();
  List<String> _excludedFolders = [];

  @override
  void initState() {
    super.initState();
    _loadExcludedFolders();
  }

  Future<void> _loadExcludedFolders() async {
    // Read directly from the provider or the instance
    final repository = ref.read(songRepositoryProvider);
    // Wait, songRepositoryProvider is synchronous in ref.watch, wait, in audio_providers it is defined as:
    // @Riverpod(keepAlive: true) SongRepository songRepository(Ref ref)
    // Actually the function in audio_providers is just returning the initialized object.

    final folders = await repository.getExcludedFolders();
    if (mounted) {
      setState(() {
        _excludedFolders = folders;
      });
    }
  }

  Future<void> _addFolder() async {
    final path = _pathController.text.trim();
    if (path.isNotEmpty) {
      await ref.read(songRepositoryProvider).addExcludedFolder(path);
      _pathController.clear();
      await _loadExcludedFolders();
    }
  }

  Future<void> _removeFolder(String path) async {
    await ref.read(songRepositoryProvider).removeExcludedFolder(path);
    await _loadExcludedFolders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Excluded Folders')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pathController,
                    decoration: const InputDecoration(
                      hintText:
                          'Enter absolute folder path (e.g. /storage/emulated/0/Ringtones)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: _addFolder,
                ),
              ],
            ),
          ),
          Expanded(
            child: _excludedFolders.isEmpty
                ? const Center(child: Text('No folders excluded.'))
                : ListView.builder(
                    itemCount: _excludedFolders.length,
                    itemBuilder: (context, index) {
                      final path = _excludedFolders[index];
                      return ListTile(
                        leading: const Icon(
                          Icons.folder_off,
                          color: Colors.grey,
                        ),
                        title: Text(path),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeFolder(path),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
