import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iti_projects/projects/data/models/auth_request.dart';
import 'package:iti_projects/projects/data/models/user_model.dart';
import 'package:iti_projects/projects/data/sources/remote/firebase_service.dart';

class AuthRepository {
  final FirebaseService fbService;

  AuthRepository(this.fbService);
  Future<bool> login(AuthRequest request) async {
    final credential = await fbService.login(request);
    if (credential != null) {
      return true;
    }
    return false;
  }

  Future<bool> register(AuthRequest request) async {
    final credential = await fbService.register(request);
    if (credential != null) {
      return true;
    }
    return false;
  }

  Future<UserModel> getUserInfo(String id) async {
    final userInfo = await fbService.getUserInfo(id);
    return UserModel.fromMap(userInfo);
  }
}
