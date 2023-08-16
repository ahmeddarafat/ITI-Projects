import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_projects/projects/data/models/auth_request.dart';

abstract class FirebaseService {
  Future<UserCredential?> login(AuthRequest request);
  Future<UserCredential?> register(AuthRequest request);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseAuth _auth;
  FirebaseServiceImpl(FirebaseAuth auth) : _auth = auth;

  @override
  Future<UserCredential?> login(AuthRequest request) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw Exception('The Email or Password is not correct');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<UserCredential?> register(AuthRequest request) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Exception('The account already exists for that email.');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
