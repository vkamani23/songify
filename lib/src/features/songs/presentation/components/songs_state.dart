import 'package:dart_mappable/dart_mappable.dart';
import 'package:songify/src/core/models/song.dart';

part 'songs_state.mapper.dart';

@MappableClass()
class SongsState with SongsStateMappable {
  final List<Song> songs;

  SongsState({required this.songs});
}
