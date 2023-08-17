import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/projects/data/repository/auth_repository.dart';
import 'package:iti_projects/projects/data/sources/remote/firebase_service.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late final AuthRepository repo;
  @override
  void initState() {
    super.initState();
    repo = AuthRepository(
      FirebaseServiceImpl(
        auth: FirebaseAuth.instance,
        db: FirebaseFirestore.instance,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.getUserInfo("wDqob5EukcDHsiBA3cPd"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Column(
            children: [
              Text(
                snapshot.data!.firstName,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 20),
              Text(
                snapshot.data!.lastName,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                snapshot.data!.age.toString(),
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }
}
