import 'package:equatable/equatable.dart';
import 'package:study_buddy/core/constants/time_constants.dart';

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
          bool? isActive}) =>
      PomodoroState(
          totalTime: totalTime ?? this.totalTime,
          restTime: restTime ?? this.restTime,
          remainingTime: remainingTime ?? this.remainingTime,
          completedSessions: completedSessions ?? this.completedSessions,
          isRestTime: isRestTime ?? this.isRestTime,
          isActive: isActive ?? this.isActive);

  @override
  List<Object> get props =>
      [totalTime, remainingTime, completedSessions, isRestTime];
}

class PomodoroInitialState extends PomodoroState {
  const PomodoroInitialState(
      {super.totalTime = thirtyMinutes,
      super.restTime = fiveMinutes,
      super.remainingTime = thirtyMinutes,
      super.completedSessions = 0});
}
