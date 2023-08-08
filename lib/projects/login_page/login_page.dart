import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

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
                  decoration: const InputDecoration(hintText: "Phone"),
                  validator: (phone) {
                    if (phone!.length < 11) {
                      return "enter correct phone number";
                    }
                    return null;
                  },
                ),
                TextFormField(
                    decoration: const InputDecoration(hintText: "Password"),
                    validator: (password) {
                      if (password!.length < 11) {
                        return "enter storng password";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        
                      }
                  },
                  child: const Text("login"),
                ),
                const SizedBox(height: 20),
                const Text("Forget Password? tap me"),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text("no Account Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
