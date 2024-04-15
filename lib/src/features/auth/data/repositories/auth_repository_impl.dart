import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:songify/src/core/auth/auth_repository.dart';
import 'package:songify/src/core/models/user.dart';

class FirebaseAuthRepositoryImpl extends AuthRepositoryImpl {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserModelMapper.fromMap({
        'id': user.uid,
        'email': user.email!,
      });
    } else {
      return null;
    }
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (error) {
      // Handle specific auth errors (e.g., wrong password, user not found)
      throw Exception(error.message);
    }
  }

  @override
  Future<bool> signUp(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        _firestore.collection("users").doc(user.uid).set({
          'favouriteSongIds': [],
        });
        return true;
      }
      return false;
    } on FirebaseAuthException catch (error) {
      // Handle specific auth errors (e.g., weak password)
      throw Exception(error.message);
    }
  }
}
