import 'package:flutter/material.dart';
import 'package:songify/src/features/auth/presentation/login_screen.dart';
import 'package:songify/src/features/songs/presentation/song_details_screen.dart';
import 'package:songify/src/features/songs/presentation/song_list_screen.dart';

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SongListScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => const SongListScreen(),
        );
      case SongDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => const SongDetailsScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(builder: (ctx) {
          return const Scaffold(
            body: Center(
              child: Text("404 routes not found"),
            ),
          );
        });
    }
  }
}
