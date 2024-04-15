import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:songify/generated/assets.dart';
import 'package:songify/src/app/constants/theme.dart';
import 'package:songify/src/app/routing/app_routing.dart';
import 'package:songify/src/core/auth/auth_repository.dart';
import 'package:songify/src/core/player/audio_player.dart';
import 'package:songify/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:songify/src/features/auth/presentation/login_screen.dart';
import 'package:songify/src/features/songs/data/repositories/favourite_song_repository.dart';
import 'package:songify/src/features/songs/presentation/components/songs_provider.dart';
import 'package:songify/src/features/songs/presentation/song_list_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        authRepositoryProvider
            .overrideWith((ref) => FirebaseAuthRepositoryImpl()),
      ],
      child: const MainApp(),
    );
  }
}

final setup = FutureProvider((ref) => Future.wait([
      /// For splash screen animation
      Future.delayed(const Duration(seconds: 2)),
      ref.read(authStateNotifier.notifier).getCurrentUser(),
      ref.read(songsStateNotifier.notifier).fetchSongs(),
      ref.read(favouriteSongRepositoryProvider).getFavoriteSongs(),
      Future.value(ref.read(audioPlayerProvider).currentSong),
    ]));

class MainApp extends ConsumerWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setup);
    return state.when(
      data: (data) {
        return MaterialApp(
          title: 'Songify',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SongListScreen.routeName,
          navigatorKey: NavKey.navKey,
        );
      },
      error: (error, st) {
        return MaterialApp(
          title: 'Songify',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(
            body: Center(
              child: Text(
                "Something went wrong, please try later!",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.red),
              ),
            ),
          ),
        );
      },
      loading: () {
        final size = MediaQuery.sizeOf(context);
        final deviceResolution =
            double.parse((size.width / size.height).toStringAsFixed(1));
        final splashLottieResolution =
            double.parse((750 / 1624).toStringAsFixed(1));
        return MaterialApp(
          title: 'Songify',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SizedBox(
              width: size.width,
              height: size.height,

              /// Whenever the lottie changes, this should change as well
              child: Transform.translate(
                offset: deviceResolution <= splashLottieResolution
                    ? Offset.zero
                    : Offset(0, -size.height * 0.12),
                child: LottieBuilder.asset(
                  Assets.animationsSongify,
                  repeat: false,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
