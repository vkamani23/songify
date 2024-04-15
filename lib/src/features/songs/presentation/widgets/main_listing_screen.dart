import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/app/constants/colors.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/now_playing_state_notifier.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:songify/src/features/auth/presentation/login_screen.dart';
import 'package:songify/src/features/songs/presentation/components/favourite_provider.dart';
import 'package:songify/src/features/songs/presentation/song_details_screen.dart';
import 'package:songify/src/features/songs/presentation/widgets/song_search_delegate.dart';

class MainSongListScreen extends ConsumerWidget {
  const MainSongListScreen({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlaying = ref.read(nowPlayingProvider.notifier);
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SizedBox(
          height: constraints.maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(songs: songs),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return SongItemTile(
                      song: songs[index],
                      onPressed: () {
                        nowPlaying.setPlaylist(songs, songs[index]);
                        Navigator.of(context)
                            .pushNamed(SongDetailsScreen.routeName);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 22,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                showSearchFunction(context, ref);
              },
              child: const TextField(
                cursorColor: Colors.black87,
                enabled: false,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search songs",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSearchFunction(BuildContext context, WidgetRef ref) async {
    await showSearch<Song?>(
      context: context,
      delegate: SongSearchDelegate(ref, songs),
    );
    // if (result != null) {
    //   // Handle selected song (optional)
    // }
  }
}

class SongItemTile extends ConsumerWidget {
  const SongItemTile({
    super.key,
    required this.song,
    required this.onPressed,
  });

  final Song song;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    blurRadius: 12.0,
                    spreadRadius: 8.0,
                    offset: Offset.zero,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(
                    20,
                  ), // Image radius
                  child: Hero(
                    tag: "song_${song.id}",
                    child: Image.asset(
                      song.posterUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 12.0,
                      spreadRadius: 8.0,
                      offset: Offset.zero,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          song.title,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          song.artist.join(", "),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        final userId = ref.watch(userInfoStateNotifier
                            .select((value) => value.userId));
                        if (userId == null || userId.isEmpty) {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        } else {
                          ref
                              .read(favouriteSongProvider.notifier)
                              .toggleFavourite(song);
                        }
                      },
                      icon: Icon(
                        song.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 26,
                        color: ColorConstants.greenMatte,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
