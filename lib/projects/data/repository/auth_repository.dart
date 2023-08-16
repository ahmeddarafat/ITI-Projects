import 'package:iti_projects/projects/data/models/auth_request.dart';
import 'package:iti_projects/projects/data/sources/remote/firebase_service.dart';

class AuthRepository {
  final FirebaseService auth;

  AuthRepository(this.auth);
  Future<bool> login(AuthRequest request) async {
    final credential = await auth.login(request);
    if (credential != null) {
      return true;
    }
    return false;
  }

  Future<bool> register(AuthRequest request) async {
    final credential = await auth.register(request);
    if (credential != null) {
      return true;
    }
    return false;
  }
}
