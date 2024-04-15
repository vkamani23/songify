import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/features/songs/data/usecases/favourite_song_usecase_impl.dart';

final favSongLocalUseCaseProvider =
    Provider((ref) => FavouriteSongsUseCaseLocalImpl());

abstract class FavouriteSongsUseCase {
  Future<void> setFavorite(String songId, bool isFavorite);
  Future<void> setStringList(String key, List<String> favouriteSongIds);
  Future<List<String>> getFavoriteSongIds();
}
