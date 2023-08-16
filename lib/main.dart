import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/projects/bloc/task/task_cubit.dart';
import 'package:iti_projects/projects/data/repository/repository.dart';
import 'package:iti_projects/projects/data/sources/remote/api_service.dart';
import 'package:iti_projects/projects/presentation/login/login_page.dart';
import 'package:iti_projects/projects/data/sources/local/shared_prefs.dart';
import 'package:iti_projects/projects/presentation/tasks/tasks_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(Repository(ApiService())),
      child: MaterialApp(
        title: 'ITI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
