import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/projects/data/models/task_model.dart';
import 'package:iti_projects/projects/data/repository/repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final Repository repo;
  TaskCubit(this.repo) : super(TaskInitial());

  static TaskCubit get(BuildContext context) => BlocProvider.of(context);

  Future<List<TaskModel>> getTasks() async {
    return await repo.getTasks();
  }


  
}
