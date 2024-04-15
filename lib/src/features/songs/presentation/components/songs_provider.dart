import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/extensions/string_extensions.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:songify/src/features/songs/data/sources/song_list_datasource.dart';
import 'package:songify/src/features/songs/presentation/components/songs_state.dart';

final songsStateNotifier =
    StateNotifierProvider<SongsStateNotifier, SongsState>(
        (ref) => SongsStateNotifier(ref: ref));

class SongsStateNotifier extends StateNotifier<SongsState> {
  SongsStateNotifier({required this.ref})
      : _songListDatasource = ref.read(songListDatasourceProvider),
        super(SongsState(songs: [])) {
    ref.listen(userInfoStateNotifier, (previous, next) {
      if (!next.favSongIds.compareListsUnordered(previous?.favSongIds ?? [])) {
        fetchSongs();
      }
    });
  }

  final Ref ref;
  final SongListDatasource _songListDatasource;
  late List<String> favSongs;

  Future<void> fetchSongs() async {
    final songs = await _songListDatasource.getSongs();
    final favSongIds = ref.read(userInfoStateNotifier).favSongIds;
    if (songs.isNotEmpty && favSongIds.isNotEmpty) {
      state = state.copyWith(
          songs: songs
              .map((e) => e.copyWith(isFavourite: favSongIds.contains(e.id)))
              .toList());
    } else if (songs.isNotEmpty) {
      state = state.copyWith(songs: songs);
    }
  }
}
// part 'songs_provider.g.dart';

// @riverpod
// Future<List<Song>> songs(SongsRef ref) async {
//   try {
//     final datasource = ref.watch(songListDatasourceProvider);
//     final songs = await datasource.getSongs();
//     final favSongIds = ref.watch(
//         userInfoRepositoryProvider.select((value) => value.favouriteSongIds));
//     if (songs.isNotEmpty || favSongIds.isNotEmpty) {
//       // final favouriteSongUseCase = ref.watch(favSongLocalUseCaseProvider);
//       // final favSongIds = await favouriteSongUseCase.getFavoriteSongIds();
//
//       return songs
//           .map((e) => e.copyWith(isFavourite: favSongIds.contains(e.id)))
//           .toList();
//     }
//     return songs;
//   } catch (err, st) {
//     debugPrint(err.toString());
//     debugPrintStack(stackTrace: st);
//     rethrow;
//   }
// }
