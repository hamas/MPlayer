import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

Future<MPlayerAudioHandler> initAudioService() async {
  final handler = await AudioService.init(
    builder: () => MPlayerAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.hamas.mplayer.channel.audio',
      androidNotificationChannelName: 'MPlayer Audio',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
  return handler;
}

class MPlayerAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final AndroidEqualizer _equalizer = AndroidEqualizer();
  final AndroidLoudnessEnhancer _loudnessEnhancer = AndroidLoudnessEnhancer();
  late final AudioPlayer _player;

  // ignore: deprecated_member_use
  final _playlist = ConcatenatingAudioSource(children: []);

  double _crossfadeDuration = 0.0;

  MPlayerAudioHandler() {
    _player = AudioPlayer(
      audioPipeline: AudioPipeline(
        androidAudioEffects: [_equalizer, _loudnessEnhancer],
      ),
    );
    _init();
  }

  void setCrossfadeDuration(double duration) {
    _crossfadeDuration = duration;
  }

  // Experimental crossfade/smooth transition
  Future<void> _smoothSkip(Future<void> Function() skipAction) async {
    if (_crossfadeDuration > 0) {
      await _player.setVolume(0.0);
      await skipAction();
      await _player.setVolume(
        1.0,
      ); // Ideally should ramp but just audio volume is sync
    } else {
      await skipAction();
    }
  }

  AndroidEqualizer get equalizer => _equalizer;
  AndroidLoudnessEnhancer get loudnessEnhancer => _loudnessEnhancer;

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    // Load the playlist
    // await _player.setAudioSource(_playlist); // Don't set empty playlist yet, it might error or be useless.

    // Notify AudioService of current child
    _player.currentIndexStream.listen((index) {
      if (index != null &&
          queue.value.isNotEmpty &&
          index < queue.value.length) {
        mediaItem.add(queue.value[index]);
      }
    });

    // Propagate playback state
    _player.playbackEventStream.listen(_broadcastState);

    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        // managed by playlist usually
      }
    });
  }

  void _broadcastState(PlaybackEvent event) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (_player.playing) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: _player.playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ),
    );
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }

  @override
  Future<void> skipToNext() => _smoothSkip(() => _player.seekToNext());

  @override
  Future<void> skipToPrevious() => _smoothSkip(() => _player.seekToPrevious());

  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    final audioSources = mediaItems.map(_createAudioSource).toList();
    await _playlist.addAll(audioSources);

    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    await _playlist.add(_createAudioSource(mediaItem));

    final newQueue = queue.value..add(mediaItem);
    queue.add(newQueue);
  }

  @override
  Future<void> updateQueue(List<MediaItem> queue) async {
    await _playlist.clear();
    await _playlist.addAll(queue.map(_createAudioSource).toList());

    // Note: 'ConcatenatingAudioSource' usage is standard in just_audio.
    // If flagged as deprecated by valid lints in future, switch to setAudioSource with list.

    this.queue.add(queue);
  }

  AudioSource _createAudioSource(MediaItem item) {
    Uri audioUri;
    final urlStr = item.extras?['url'] as String? ?? item.id;
    try {
      audioUri = Uri.parse(urlStr);
      if (audioUri.scheme.isEmpty) {
        // Assume file path if no scheme
        audioUri = Uri.file(urlStr);
      }
    } catch (e) {
      // Fallback
      audioUri = Uri.file(urlStr);
    }

    return AudioSource.uri(
      audioUri,
      tag: item, // Store MediaItem as tag for extraction later if needed
    );
  }

  // Custom: Play a specific item from a new queue
  // This is often used when clicking a song in a list: replace queue? or just play?
  // Usually: set queue context -> play index.
  Future<void> playFromQueue(List<MediaItem> mediaItems, int index) async {
    // Optimize: Only update if queue is different?
    // For simplicity, just reset.
    await _player.pause();

    await _playlist.clear();
    await _playlist.addAll(mediaItems.map(_createAudioSource).toList());
    queue.add(mediaItems);

    // We must set the source if not already set, or if we cleared it.
    // With JustAudio, modifying the playlist (ConcatenatingAudioSource) is efficient.
    // But we need to make sure _player uses _playlist.
    if (_player.audioSource != _playlist) {
      await _player.setAudioSource(_playlist, initialIndex: index);
    } else {
      await _player.seek(Duration.zero, index: index);
    }

    await _player.play();
  }
}
