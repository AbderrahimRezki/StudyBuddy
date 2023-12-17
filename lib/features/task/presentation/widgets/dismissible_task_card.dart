import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_state.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_card.dart';

class DismissibleTaskCard extends StatelessWidget {
  final TaskCard taskCard;
  const DismissibleTaskCard({super.key, required this.taskCard});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Dismissible(
          key: GlobalKey(),
          background: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: MyColorScheme.green,
              ),
              child: Icon(
                Icons.check,
                color: MyColorScheme.white,
              )),
          secondaryBackground: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyColorScheme.red),
              child: Icon(
                Icons.cancel,
                color: MyColorScheme.white,
              )),
          child: taskCard,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              context.read<TasksCubit>().markTaskAsDone(taskCard.task);
            }
            if (direction == DismissDirection.endToStart) {}
          },
        );
      },
    );
  }
}
