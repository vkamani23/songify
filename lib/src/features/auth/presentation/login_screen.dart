import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:songify/generated/assets.dart';
import 'package:songify/src/app/constants/colors.dart';
import 'package:songify/src/features/auth/presentation/components/auth_state.dart';
import 'package:songify/src/features/songs/presentation/song_list_screen.dart';

import 'components/auth_state_notifier.dart';

final authStateNotifier = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier(ref: ref));

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifier);
    final notifier = ref.watch(authStateNotifier.notifier);

    ref.listen(authStateNotifier, (previous, next) {
      if (next.isAuthenticated &&
          (next.error?.isEmpty ?? true) &&
          !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
          ),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          SongListScreen.routeName,
          (route) => false,
        );
      }
    });
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              elevation: 0,
              flexibleSpace: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Lottie.asset(
                      Assets.animationsSongify,
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              backgroundColor: ColorConstants.greenMatte,
              expandedHeight: 150,
              leading: null,
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: notifier.setEmail,
                  validator: (value) =>
                      !AuthStateNotifier.emailRegex.hasMatch(value!)
                          ? 'Invalid email format'
                          : null,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: notifier.setPassword,
                  validator: (value) => !AuthStateNotifier.passwordRegex
                          .hasMatch(value!)
                      ? '- Password must be at least 8 characters\n- At least one lowercase letter (a-z)\n- At least one uppercase letter (A-Z)\n- At least one digit (0-9)\n- At least one special character (@\$!%*?&)'
                      : null,
                ),
                const SizedBox(height: 20.0),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: notifier.login,
                        child: const Text('Login'),
                      ),
                if (state.error != null)
                  Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
