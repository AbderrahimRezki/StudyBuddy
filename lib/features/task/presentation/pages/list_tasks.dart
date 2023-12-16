import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/task/data/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_tasks.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/task_card.dart';
import 'package:study_buddy/features/task/presentation/pages/add_task.dart';

class TasksPage extends StatelessWidget {
  final UserEntity user;
  const TasksPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> taskData = [
    //   {
    //     'title': 'Read Chapter 4.1',
    //     'category': 'History',
    //     'timeLeft': '2h',
    //     'priorityLevel': 2,
    //   },
    //   {
    //     'title': 'Complete Algebra Exercise',
    //     'category': 'Math',
    //     'timeLeft': '4h',
    //     'priorityLevel': 1,
    //   },
    //   {
    //     'title': 'Write Essay on Renaissance',
    //     'category': 'Literature',
    //     'timeLeft': '1d',
    //     'priorityLevel': 0,
    //   },
    // ];

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            const CurrentDateWidget(),
            Expanded(
              child: FutureBuilder(
                future: GetAllTasksUseCase()(TaskRepositoryImpl()),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final task = snapshot.data![index];
                            return TaskCard(
                              title: task.taskTitle ?? "My Task",
                              category: "task",
                              timeLeft: "1h",
                              priorityLevel: 0,
                            );
                          },
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
        BlocBuilder<PageCubit, PageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 100),
              child: FloatingActionButton(
                backgroundColor: MyColorScheme.primaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTaskScreenState()));
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class CurrentDateWidget extends StatelessWidget {
  const CurrentDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentDate =
        DateFormat('EEEE, d MMMM').format(DateTime.now());

    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Text(
        currentDate,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
