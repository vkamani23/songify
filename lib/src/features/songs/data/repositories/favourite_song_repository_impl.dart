import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/extensions/string_extensions.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository.dart';
import 'package:songify/src/features/songs/data/usecases/favourite_song_usecase.dart';
import 'package:songify/src/features/songs/data/usecases/favourite_song_usecase_impl.dart';
import 'package:songify/src/features/songs/presentation/components/songs_provider.dart';

class FavouriteSongRepositoryImpl implements FavoriteSongsRepository {
  FavouriteSongRepositoryImpl({
    required this.ref,
  }) {
    favouriteSongsUseCase = ref.read(favSongLocalUseCaseProvider);
    setIsConnected();
    connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        _isConnected = true;
        updateFavouritesOnRemoteIfChanged();
      }
    });

    ref.listen(songsStateNotifier, (prev, next) {
      if (!next.songs.compareListsUnordered(prev?.songs ?? [])) {
        playlist.clear();
        playlist.addAll([...next.songs]);
      }
    });
  }

  final Ref ref;
  late FavouriteSongsUseCase favouriteSongsUseCase;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Connectivity connectivity = Connectivity();
  List<Song> playlist = [];

  bool _isConnected = false;

  String get userId {
    return ref
        .watch(userInfoStateNotifier.select((value) => value.userId ?? ''));
  }

  Future<void> setIsConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      _isConnected = true;
    }
  }

  @override
  Future<List<Song>> getFavoriteSongs() async {
    final localSongIds = await favouriteSongsUseCase.getFavoriteSongIds();
    List<String> remoteSongIds = [];
    if (_isConnected && userId.isNotEmpty) {
      final docRef = _firestore.collection('users').doc(userId);
      final snapshot = await docRef.get();
      if (snapshot.exists) {
        final data = snapshot["favouriteSongIds"] as List<dynamic>;
        remoteSongIds.addAll(data.isNotEmpty ? data.cast<String>() : []);
      }
    }
    final favoriteSongs = <Song>[];
    if (playlist.isNotEmpty) {
      favoriteSongs.addAll([
        ...(playlist
            .where((element) =>
                localSongIds.contains(element.id) ||
                remoteSongIds.contains(element.id))
            .map((e) => e.copyWith(isFavourite: true))
            .toList())
      ]);
    }
    ref
        .read(userInfoStateNotifier.notifier)
        .updateFavSongIds(favoriteSongs.map((e) => e.id).toList());
    return favoriteSongs;
  }

  @override
  Future<void> setAllFavorites(List<String> songIds) async {
    await favouriteSongsUseCase.setStringList(
        FavouriteSongsUseCaseLocalImpl.favSongsKey, songIds);
    if (_isConnected && userId.isNotEmpty) {
      final docRef = _firestore.collection('users').doc(userId);
      await docRef.set({
        'favouriteSongIds': songIds,
      });
    }
  }

  @override
  Future<void> setFavorite(String songId, bool isFavorite) async {
    try {
      favouriteSongsUseCase.setFavorite(songId, isFavorite);
      final favSongs =
          ref.read(userInfoStateNotifier.select((value) => value.favSongIds));
      if (favSongs.contains(songId)) {
        ref.read(userInfoStateNotifier.notifier).updateFavSongIds(
            favSongs.takeWhile((value) => value != songId).toList());
      } else {
        ref
            .read(userInfoStateNotifier.notifier)
            .updateFavSongIds([...favSongs, songId]);
      }
      if (_isConnected && userId.isNotEmpty) {
        final docRef = _firestore.collection("users").doc(userId);
        final snapshot = await docRef.get();
        if (snapshot.exists) {
          final oldData = snapshot.get("favouriteSongIds");
          if (oldData.isEmpty && isFavorite) {
            _firestore.collection("users").doc(userId).set({
              "favouriteSongIds": [songId],
            });
          } else if (oldData.isNotEmpty &&
              oldData.contains(songId) &&
              !isFavorite) {
            oldData.removeWhere((element) => element == songId);
            _firestore.collection("users").doc(userId).set({
              "favouriteSongIds": oldData,
            });
          } else if (oldData.isNotEmpty &&
              !oldData.contains(songId) &&
              isFavorite) {
            _firestore.collection("users").doc(userId).set({
              "favouriteSongIds": [...oldData, songId],
            });
          }
        }
      }
    } catch (e) {
      debugPrint(
          "Error while setting song's favourite status: ${e.toString()}");
    }
  }

  Future<void> updateFavouritesOnRemoteIfChanged() async {
    final songIds = await favouriteSongsUseCase.getFavoriteSongIds();
    final shouldUpdate = !songIds.compareListsUnordered(
      playlist
          .where((element) => element.isFavourite)
          .map((e) => e.id)
          .toList(),
    );
    if (shouldUpdate) {
      setAllFavorites(songIds);
    }
  }
}
