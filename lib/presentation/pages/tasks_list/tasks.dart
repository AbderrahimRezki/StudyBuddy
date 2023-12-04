import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_buddy/presentation/widgets/skeleton/top_bar.dart';
import 'package:study_buddy/presentation/widgets/skeleton/task_card.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/widgets/skeleton/navigation_bar.dart';
import 'package:study_buddy/presentation/widgets/skeleton/progress_bar.dart';

class TasksPage extends StatelessWidget {
  final UserEntity user;
  const TasksPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final double progressValue = user.progress / 100;
    final List<Map<String, dynamic>> taskData = [
      {
        'title': 'Read Chapter 4.1',
        'category': 'History',
        'timeLeft': '2h',
        'priorityLevel': 2,
      },
      {
        'title': 'Complete Algebra Exercise',
        'category': 'Math',
        'timeLeft': '4h',
        'priorityLevel': 1,
      },
      {
        'title': 'Write Essay on Renaissance',
        'category': 'Literature',
        'timeLeft': '1d',
        'priorityLevel': 0,
      },
    ];

    return Scaffold(
      appBar: TopBar(user: user),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ProgressBar(
              value: progressValue,
              height: 10,
              foregroundColor: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          CurrentDateWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: taskData.length,
              itemBuilder: (context, index) {
                final task = taskData[index];
                return TaskCard(
                  title: task['title'],
                  category: task['category'],
                  timeLeft: task['timeLeft'],
                  priorityLevel: task['priorityLevel'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyNavigationBar(),
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
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
