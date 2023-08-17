import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_projects/projects/data/models/auth_request.dart';

abstract class FirebaseService {
  Future<UserCredential?> login(AuthRequest request);
  Future<UserCredential?> register(AuthRequest request);

  Future<Map<String, dynamic>> getUserInfo(String id);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  FirebaseServiceImpl({required this.auth, required this.db});

  @override
  Future<UserCredential?> login(AuthRequest request) async {
    try {
      return await auth.signInWithEmailAndPassword(
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
      return await auth.createUserWithEmailAndPassword(
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

  @override
  Future<Map<String, dynamic>> getUserInfo(String id) async {
    final userInfo = await db.collection("user-info").doc(id).get();
    return userInfo.data() ?? {};
  }
}
