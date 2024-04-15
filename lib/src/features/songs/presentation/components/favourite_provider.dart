import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/now_playing_state_notifier.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository.dart';

part 'favourite_provider.g.dart';

@riverpod
class FavouriteSong extends _$FavouriteSong {
  @override
  List<String> build() {
    final playlist = ref
        .watch(nowPlayingProvider.select((value) => value.playlist))
        .map((e) => e.id)
        .toList();
    return playlist;
  }

  void toggleFavourite(Song song) {
    final favouriteRepo = ref.read(favouriteSongRepositoryProvider);
    final favValue = !song.isFavourite;
    favouriteRepo.setFavorite(song.id, favValue);
  }
}
