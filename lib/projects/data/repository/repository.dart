import 'package:iti_projects/projects/data/sources/remote/api_service.dart';

import '../models/task_model.dart';

class Repository {
  final ApiService apiService;

  Repository(this.apiService);

  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];
    final response = await apiService.getData(endPoint: EndPoints.todos);
    for (var task in response.data) {
      tasks.add(TaskModel.fromMap(task));
    }
    return tasks;
  }
}
