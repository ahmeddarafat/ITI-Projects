import 'package:flutter/material.dart';
import 'package:iti_projects/projects/shared_prefs/shared_prefs.dart';

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

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SharedPrefs.setEmail(_emailController.text);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(
                            email: _emailController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("login"),
                ),
                const SizedBox(height: 20),
                const Text("Forget Password? tap me"),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {}, child: const Text("no Account Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
