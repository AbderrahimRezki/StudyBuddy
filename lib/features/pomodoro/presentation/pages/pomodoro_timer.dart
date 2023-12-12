import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/cubits/pomodoro_cubit.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/states/pomodoro_state.dart';
import 'package:study_buddy/features/pomodoro/presentation/widgets/circular_timer.dart';

class Pomodoro extends StatelessWidget {
  static const pageRoute = "/timer";
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroCubit(),
      child: BlocBuilder<PomodoroCubit, PomodoroState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text("${state.completedSessions} sessions done"),
                const SizedBox(
                  height: 50,
                ),
                CircularTimer(
                  remainingTime: state.remainingTime,
                  totalTime: state.totalTime,
                  fillColor: state.isRestTime
                      ? MyColorScheme.primaryColor
                      : MyColorScheme.green,
                  strokeWidth: 15,
                  dimension: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed:
                                context.read<PomodoroCubit>().startOrReset,
                            icon: Icon(state.isActive
                                ? Icons.replay
                                : Icons.play_arrow))
                      ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
