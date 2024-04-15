import 'package:shared_preferences/shared_preferences.dart';

import 'favourite_song_usecase.dart';

class FavouriteSongsUseCaseLocalImpl implements FavouriteSongsUseCase {
  static const String favSongsKey = 'favorite_songs';

  @override
  Future<void> setFavorite(String songId, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteSongIds = prefs.getStringList(favSongsKey) ?? [];
    if (isFavorite) {
      favoriteSongIds.add(songId);
    } else {
      favoriteSongIds.remove(songId);
    }
    await prefs.setStringList(favSongsKey, favoriteSongIds);
  }

  @override
  Future<List<String>> getFavoriteSongIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favSongsKey) ?? [];
  }

  @override
  Future<void> setStringList(String key, List<String> favouriteSongIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(favSongsKey, favouriteSongIds);
  }
}
