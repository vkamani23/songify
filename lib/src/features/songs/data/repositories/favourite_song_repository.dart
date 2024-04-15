import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository_impl.dart';

final favouriteSongRepositoryProvider =
    Provider((ref) => FavouriteSongRepositoryImpl(ref: ref));

abstract class FavoriteSongsRepository {
  Future<void> setFavorite(String songId, bool isFavorite);
  Future<List<Song>> getFavoriteSongs();
  Future<void> setAllFavorites(List<String> songIds);
}
