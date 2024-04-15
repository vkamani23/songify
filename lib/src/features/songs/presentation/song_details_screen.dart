import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/extensions/string_extensions.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/core/player/audio_player.dart';
import 'package:songify/src/core/player/audio_player_state.dart';
import 'package:songify/src/core/player/now_playing_state_notifier.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:songify/src/features/auth/presentation/login_screen.dart';
import 'package:songify/src/features/songs/presentation/components/favourite_provider.dart';

class SongDetailsScreen extends ConsumerWidget {
  const SongDetailsScreen({
    super.key,
  });

  static const String routeName = '/details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlaying = ref.read(nowPlayingProvider.notifier);
    final song =
        ref.watch(nowPlayingProvider.select((value) => value.currentSong));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LayoutBuilder(builder: (context, constraints) {
        if (song == null) {
          return const SizedBox();
        }
        return Stack(
          children: [
            Container(
              color: Colors.black87,
            ),
            // Content wrapper
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _HeaderWidget(),
                  Hero(
                    tag: "song_${song.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        song.posterUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Song title and artist
                  Text(
                    song.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    song.artist.join(", "),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  _ProgressWidget(song: song),
                  const _BottomSection(),
                ],
              ),
            ),
          ],
        );
        //   song.when(
        //   data: (data) {
        //     if (data == null) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     return
        //   },
        //   error: (error, _) => Center(
        //     child: Text(
        //       error.toString(),
        //       style: Theme.of(context)
        //           .textTheme
        //           .bodyLarge
        //           ?.copyWith(color: Colors.red),
        //     ),
        //   ),
        //   loading: () => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
      }),
    );
  }
}

class _HeaderWidget extends ConsumerWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final song =
        ref.watch(nowPlayingProvider.select((value) => value.currentSong));
    final isFavourite = ref.watch(userInfoStateNotifier
        .select((value) => value.favSongIds.contains(song!.id)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button (optional)
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // Favorite button
        IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            final userId = ref
                .watch(userInfoStateNotifier.select((value) => value.userId));
            if (userId == null || userId.isEmpty) {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            } else {
              ref.read(favouriteSongProvider.notifier).toggleFavourite(song!);
            }
          },
        ),
      ],
    );
  }
}

class _ProgressWidget extends ConsumerWidget {
  const _ProgressWidget({
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position =
        ref.watch(audioPlayerProvider.select((value) => value.position));
    return Column(
      children: [
        MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Colors.transparent,
              thumbShape: null,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            ),
            child: Slider(
              value: position.inSeconds.toDouble(),
              min: const Duration(seconds: 0).inSeconds.toDouble(),
              max: song.durationInSecs.toDouble(),
              allowedInteraction: SliderInteraction.tapAndSlide,
              onChanged: (value) {
                ref.read(audioPlayerProvider.notifier).setPosition(value);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                position.formatDurationToString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                Duration(seconds: song.durationInSecs).formatDurationToString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BottomSection extends ConsumerWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlaying = ref.read(nowPlayingProvider.notifier);
    final audioPlayer = ref.watch(audioPlayerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              nowPlaying.playPrevious();
            },
          ),
          IconButton(
            icon: Icon(
              audioPlayer.playerState == AudioPlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
              size: 52.0,
            ),
            onPressed: () {
              ref.read(audioPlayerProvider.notifier).playPauseSong();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              nowPlaying.playNext();
            },
          ),
        ],
      ),
    );
  }
}
