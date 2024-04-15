import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/now_playing_state_notifier.dart';
import 'package:songify/src/features/songs/presentation/song_details_screen.dart';
import 'package:songify/src/features/songs/presentation/widgets/main_listing_screen.dart';

class SongSearchDelegate extends SearchDelegate<Song?> {
  final List<Song> allSongs;
  final WidgetRef ref;

  SongSearchDelegate(this.ref, this.allSongs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredSongs = query.isEmpty
        ? allSongs
        : allSongs
            .where((song) =>
                song.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
    final nowPlaying = ref.read(nowPlayingProvider.notifier);
    return ListView.builder(
      itemCount: filteredSongs.length,
      itemBuilder: (context, index) => SongItemTile(
        song: filteredSongs[index],
        onPressed: () {
          nowPlaying.setPlaylist(allSongs, allSongs[index]);
          Navigator.of(context).pushNamed(SongDetailsScreen.routeName);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSongs = query.isEmpty
        ? allSongs
        : allSongs
            .where((song) =>
                song.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
    final nowPlaying = ref.read(nowPlayingProvider.notifier);
    return ListView.builder(
      itemCount: filteredSongs.length,
      itemBuilder: (context, index) => SongItemTile(
        song: filteredSongs[index],
        onPressed: () {
          nowPlaying.setPlaylist(allSongs, allSongs[index]);
          Navigator.of(context).pushNamed(SongDetailsScreen.routeName);
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
