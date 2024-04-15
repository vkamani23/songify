import 'package:dart_mappable/dart_mappable.dart';

part 'song.mapper.dart';

@MappableClass()
class Song with SongMappable {
  final String id;
  final String title;
  final List<String> artist;
  final String audioUrl;
  final String posterUrl;
  final bool isFavourite;
  final int durationInSecs;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.posterUrl,
    required this.isFavourite,
    required this.durationInSecs,
  });
}
