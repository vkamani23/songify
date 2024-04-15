import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/audio_player_service_state.dart';
import 'package:songify/src/core/player/audio_player_state.dart';

import 'now_playing_state_notifier.dart';

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerService, AudioPlayerServiceState>(
  (ref) => AudioPlayerService(ref),
);

class AudioPlayerService extends StateNotifier<AudioPlayerServiceState> {
  AudioPlayerService(Ref ref)
      : super(
          AudioPlayerServiceState(
            playerState: AudioPlayerState.disposed,
            position: const Duration(seconds: 0),
            currentSong: null,
          ),
        ) {
    ref.listen(nowPlayingProvider.select((value) => value.currentSong),
        (previous, next) {
      if (next != null) {
        _playSong(next);
      }
    });
    _audioPlayer.onPlayerStateChanged.listen((playerState) {
      state = state.copyWith(
          playerState: switch (playerState) {
        PlayerState.playing => AudioPlayerState.playing,
        PlayerState.paused => AudioPlayerState.paused,
        PlayerState.stopped => AudioPlayerState.stopped,
        PlayerState.completed => AudioPlayerState.completed,
        PlayerState.disposed => AudioPlayerState.disposed,
      });

      if (playerState == PlayerState.completed) {
        ref.read(nowPlayingProvider.notifier).playNext();
      }
    });

    _audioPlayer.onPositionChanged.listen((event) {
      state = state.copyWith(position: event);
    });
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playPauseSong() async {
    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.pause();
    } else if (_audioPlayer.state == PlayerState.paused) {
      _audioPlayer.resume();
    }
  }

  Future<void> _playSong(Song song) async {
    // TODO: Once we get the data from remote
    // _audioPlayer.play(UrlSource(song.audioUrl));

    // For local testing
    _audioPlayer.stop();
    state = state.copyWith(
      playerState: AudioPlayerState.playing,
      position: const Duration(seconds: 0),
      currentSong: song,
    );
    _audioPlayer.play(AssetSource(song.audioUrl.replaceFirst("assets/", "")));
  }

  void setPosition(double position) {
    if (position > 0 &&
        state.currentSong != null &&
        position < state.currentSong!.durationInSecs.toDouble()) {
      _audioPlayer.seek(Duration(seconds: position.toInt()));
    }
  }
}
