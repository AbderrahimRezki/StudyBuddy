import 'package:equatable/equatable.dart';

class PomodoroState extends Equatable {
  final Duration totalTime;
  final Duration restTime;
  final Duration remainingTime;
  final int completedSessions;
  final bool isRestTime;
  final bool isActive;

  const PomodoroState(
      {required this.totalTime,
      required this.restTime,
      required this.remainingTime,
      required this.completedSessions,
      this.isRestTime = false,
      this.isActive = false});

  PomodoroState copyWith(
      {Duration? totalTime,
      Duration? restTime,
      Duration? remainingTime,
      int? completedSessions,
      bool? isRestTime,
      bool? isActive}) {
    return PomodoroState(
        totalTime: totalTime ?? this.totalTime,
        restTime: restTime ?? this.restTime,
        remainingTime: remainingTime ?? this.remainingTime,
        completedSessions: completedSessions ?? this.completedSessions);
  }

  @override
  List<Object> get props =>
      [totalTime, remainingTime, completedSessions, isRestTime];
}

class PomodoroInitialState extends PomodoroState {
  const PomodoroInitialState(
      {super.totalTime = const Duration(minutes: 30),
      super.restTime = const Duration(minutes: 5),
      super.remainingTime = const Duration(minutes: 30),
      super.completedSessions = 0});
}
