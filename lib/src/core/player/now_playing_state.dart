import 'package:dart_mappable/dart_mappable.dart';
import 'package:songify/src/core/models/song.dart';

part 'now_playing_state.mapper.dart';

@MappableClass()
class NowPlayingState with NowPlayingStateMappable {
  final List<Song> playlist;
  final Song? currentSong;
  final bool hasNext;
  final bool hasPrevious;

  NowPlayingState({
    required this.playlist,
    this.currentSong,
    this.hasNext = false,
    this.hasPrevious = false,
  });
}
