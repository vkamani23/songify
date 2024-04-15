import 'package:dart_mappable/dart_mappable.dart';

part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  final String email;
  final String password;
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;

  AuthState({
    required this.email,
    required this.password,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.error,
  });
}
