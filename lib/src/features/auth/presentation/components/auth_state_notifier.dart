import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/auth/auth_repository.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:songify/src/features/auth/presentation/components/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({
    required this.ref,
  })  : authRepository = ref.read(authRepositoryProvider),
        super(AuthState(email: '', password: ''));

  static final emailRegex = RegExp(r"[^@]+@[^@]+\.[a-zA-Z]+");
  static final passwordRegex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  final AuthRepository authRepository;
  final Ref ref;

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPassword(String password) =>
      state = state.copyWith(password: password);

  Future<void> login() async {
    // Validate email and password formats
    if (!emailRegex.hasMatch(state.email)) {
      state = state.copyWith(error: 'Invalid email format');
      return;
    }
    if (!passwordRegex.hasMatch(state.password)) {
      state = state.copyWith(error: 'Password must be at least 6 characters');
      return;
    }

    // Setting the state to show loading spinner and no errors
    state = state.copyWith(isLoading: true, error: null);
    bool isAuthenticated = false;
    try {
      isAuthenticated = await authRepository.login(
        state.email,
        state.password,
      );
    } catch (e) {
      debugPrint("Error in logging in: ${e.toString()}");
    }
    try {
      if (!isAuthenticated) {
        // User not found (likely not registered), attempt registration
        await authRepository.signUp(
          state.email,
          state.password,
        );
        // Login again after successful registration
        isAuthenticated = await authRepository.login(
          state.email,
          state.password,
        );
        if (!isAuthenticated) {
          state = state.copyWith(error: 'Registration failed');
        }
      }
      if (isAuthenticated) {
        final user = await authRepository.getCurrentUser();
        if (user != null) {
          ref.read(userInfoStateNotifier.notifier).setUserId(user.id);
          state = state.copyWith(isAuthenticated: isAuthenticated, error: null);
        }
      }
    } on Exception catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
    return Future.value(null);
  }

  Future<void> getCurrentUser() async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      ref.read(userInfoStateNotifier.notifier).setUserId(user.id);
    }
  }
}
