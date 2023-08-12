import 'package:flutter/material.dart';
import 'package:iti_projects/projects/presentation/login/login_page.dart';
import 'package:iti_projects/projects/data/sources/local/shared_prefs.dart';
import 'package:iti_projects/projects/presentation/tasks/tasks_page.dart';

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
      home: const TasksPage(),
    );
  }
}
