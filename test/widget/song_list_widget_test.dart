import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:songify/src/core/auth/auth_repository.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/models/user.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository_impl.dart';
import 'package:songify/src/features/songs/data/sources/song_list_datasource.dart';
import 'package:songify/src/features/songs/data/sources/song_list_datasource_impl.dart';
import 'package:songify/src/features/songs/presentation/song_list_screen.dart';

class FakeAuthRepository extends AuthRepositoryImpl {
  @override
  Future<UserModel?> getCurrentUser() {
    return Future.value(null);
  }

  @override
  Future<bool> login(String email, String password) {
    return Future.value(false);
  }

  @override
  Future<bool> signUp(String email, String password) {
    return Future.value(false);
  }
}

class FakeSongListDataSource extends SongListDatasourceImpl {
  @override
  Future<List<Song>> getSongs() {
    return Future.value(
      [
        Song(
          id: '00000001',
          title: "On Repeat",
          artist: ["Marcus P."],
          audioUrl: '',
          posterUrl: '',
          isFavourite: false,
          durationInSecs: 136,
        ),
        Song(
          id: '00000002',
          title: "Cozy Coffeehouse",
          artist: ["Lunar Years"],
          audioUrl: '',
          posterUrl: '',
          isFavourite: false,
          durationInSecs: 110,
        ),
      ],
    );
  }
}

class FakeFavSongRepo extends FavouriteSongRepositoryImpl {
  FakeFavSongRepo({required super.ref});

  @override
  Future<List<Song>> getFavoriteSongs() {
    return Future.value([]);
  }

  @override
  Future<void> setAllFavorites(List<String> songIds) async {}

  @override
  Future<void> setFavorite(String songId, bool isFavorite) async {}
}

void main() {
  testWidgets(
    'SongList screen',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(
              FakeAuthRepository(),
            ),
            songListDatasourceProvider.overrideWithValue(
              FakeSongListDataSource(),
            ),
            favouriteSongRepositoryProvider.overrideWith(
              (ref) => FakeFavSongRepo(ref: ref),
            )
          ],
          child: const MaterialApp(home: SongListScreen()),
        ),
      );
      expect(find.byType(SongListScreen), findsOneWidget);
    },
  );
}
