import 'package:dart_mappable/dart_mappable.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/audio_player_state.dart';

part 'audio_player_service_state.mapper.dart';

@MappableClass()
class AudioPlayerServiceState with AudioPlayerServiceStateMappable {
  final AudioPlayerState playerState;
  final Duration position;
  final Song? currentSong;

  AudioPlayerServiceState({
    required this.playerState,
    required this.position,
    required this.currentSong,
  });
}
