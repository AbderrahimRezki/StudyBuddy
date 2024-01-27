import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/current_date.dart';
import 'package:study_buddy/features/task/presentation/widgets/dismissible_task_card.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_card.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_state.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/task/presentation/pages/add_task.dart';

class TasksPage extends StatelessWidget {
  static const pageRoute = "/task";
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            const CurrentDateWidget(),
            Expanded(
              child: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  // final s = context.watch<TasksCubit>().state;
                  return (state.tasks == null || state.tasks!.isEmpty)
                      ? const Center(
                          child: Text("Click the + button to add tasks"),
                        )
                      : ListView.builder(
                          itemCount: state.tasks!.length + 1,
                          itemBuilder: (context, index) {
                            return (index == state.tasks!.length)
                                ? const SizedBox(height: 150)
                                : GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddTaskScreenState(
                                                  task: state.tasks![index],
                                                ))),
                                    child: DismissibleTaskCard(
                                        taskCard: TaskCard(
                                            task: state.tasks![index])),
                                  );
                          },
                        );
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
