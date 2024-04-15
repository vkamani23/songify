import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/models/user.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl());

abstract class AuthRepository {
  Future<bool> login(String email, String password);

  Future<bool> signUp(String email, String password);

  Future<UserModel?> getCurrentUser();
}

/// This is a dummy implementation
/// Actual to be in features/auth and the authProvider should be overridden
/// in the main.dart with actual implementation
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserModel?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
