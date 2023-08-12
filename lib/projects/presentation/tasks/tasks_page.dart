import 'package:flutter/material.dart';
import 'package:iti_projects/projects/data/repository/repository.dart';
import 'package:iti_projects/projects/data/sources/remote/api_service.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late final Repository repo;

  @override
  void initState() {
    super.initState();
    repo = Repository(ApiService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: FutureBuilder(
        future: repo.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Widget> tasks = [];
            for (var task in snapshot.data!) {
              tasks.add(
                ListTile(
                  leading: Text(task.id.toString()),
                  title: Text(task.title),
                  trailing: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: task.completed ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              );
            }
            return ListView(
              children: tasks,
            );
          }
        },
      ),
    );
  }
}
