import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/extensions/string_extensions.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/now_playing_state.dart';
import 'package:songify/src/core/user/user_information_repository.dart';

final nowPlayingProvider =
    StateNotifierProvider<NowPlayingStateNotifier, NowPlayingState>(
  (ref) => NowPlayingStateNotifier(ref),
);

class NowPlayingStateNotifier extends StateNotifier<NowPlayingState> {
  NowPlayingStateNotifier(Ref ref)
      : super(
          NowPlayingState(
            playlist: [],
          ),
        ) {
    ref.listen(userInfoStateNotifier, (previous, next) {
      if (!next.favSongIds.compareListsUnordered(previous?.favSongIds ?? [])) {
        updateFavouritesPlaylist(next.favSongIds);
      }
    });
  }

  int _currentSongIndex = -1;

  Future<void> setPlaylist(List<Song> playlist, Song currentSong) async {
    _currentSongIndex = playlist.indexOf(currentSong);
    state = state.copyWith(
      playlist: playlist,
      currentSong: currentSong,
      hasPrevious: _currentSongIndex > 0,
      hasNext: _currentSongIndex < playlist.length - 1,
    );
  }

  Future<void> updateFavouritesPlaylist(List<String> updated) async {
    final data = state.playlist
        .map((e) => updated.contains(e.id)
            ? e.copyWith(isFavourite: true)
            : e.copyWith(isFavourite: false))
        .toList();
    state = state.copyWith(playlist: data);
  }

  Future<void> playNext() async {
    if (!state.hasNext) {
      return;
    }
    _currentSongIndex++;
    state = state.copyWith(
      currentSong: state.playlist[_currentSongIndex],
      hasPrevious: _currentSongIndex > 0,
      hasNext: _currentSongIndex < state.playlist.length - 1,
    );
  }

  Future<void> playPrevious() async {
    if (!state.hasPrevious) {
      return;
    }
    _currentSongIndex--;
    state = state.copyWith(
      currentSong: state.playlist[_currentSongIndex],
      hasPrevious: _currentSongIndex > 0,
      hasNext: _currentSongIndex < state.playlist.length - 1,
    );
  }
}
