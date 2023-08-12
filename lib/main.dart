import 'package:flutter/material.dart';
import 'package:iti_projects/projects/login/login_page.dart';
import 'package:iti_projects/projects/shared_prefs/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
