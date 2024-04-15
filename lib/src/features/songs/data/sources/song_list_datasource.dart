import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/features/songs/data/sources/song_list_datasource_impl.dart';

final songListDatasourceProvider = Provider((ref) => SongListDatasourceImpl());

abstract class SongListDatasource {
  Future<List<Song>> getSongs();
}
