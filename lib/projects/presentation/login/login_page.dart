import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/projects/data/models/auth_request.dart';
import 'package:iti_projects/projects/data/repository/auth_repository.dart';
import 'package:iti_projects/projects/data/sources/local/shared_prefs.dart';
import 'package:iti_projects/projects/data/sources/remote/firebase_service.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthRepository repo;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    repo = AuthRepository(FirebaseServiceImpl(FirebaseAuth.instance));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 120),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(hintText: "email"),
                  controller: _emailController,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "enter correct email address";
                    }
                    return null;
                  },
                ),
                TextFormField(
                    decoration: const InputDecoration(hintText: "Password"),
                    controller: _passwordController,
                    validator: (password) {
                      if (password!.length < 6) {
                        return "enter storng password";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      SharedPrefs.setEmail(_emailController.text);
                      final request = AuthRequest(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (await repo.login(request)) {
                        debugPrint('login successfully');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(
                              email: _emailController.text,
                            ),
                          ),
                        );
                      } else {
                        debugPrint('Failure in login');
                      }
                    }
                  },
                  child: const Text("login"),
                ),
                const SizedBox(height: 20),
                const Text("Forget Password? tap me"),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {},
                    child: const Text("no Account Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
