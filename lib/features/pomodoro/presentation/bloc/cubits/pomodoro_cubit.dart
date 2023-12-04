import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/constants/time_constants.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/states/pomodoro_state.dart';

const initialState = PomodoroInitialState(
    totalTime: thirtyMinutes,
    restTime: fiveMinutes,
    remainingTime: thirtyMinutes,
    completedSessions: 0);

class PomodoroCubit extends Cubit<PomodoroState> {
  Timer? _timer;
  bool isPlaying = false;

  PomodoroCubit() : super(initialState) {
    isPlaying = true;
    _timer = Timer.periodic(oneSecond, update);
  }

  void start() {
    debugPrint("Started...");
    _timer?.cancel();
    emit(initialState.copyWith(isActive: true));
  }

  void update(timer) {
    if (!state.isActive) return;

    Duration remaining = state.remainingTime - oneSecond;

    if (!remaining.isNegative) {
      emit(state.copyWith(
          remainingTime: remaining, isRestTime: !state.isRestTime));
      return;
    }

    emit(state.copyWith(
        totalTime: state.isRestTime ? thirtyMinutes : fiveMinutes,
        remainingTime: state.isRestTime ? thirtyMinutes : fiveMinutes,
        isRestTime: !state.isRestTime));
  }

  void reset() {
    debugPrint("Reset...");

    isPlaying = false;
    emit(initialState);
  }

  void resume() {
    if (state.isActive) return;
    emit(state.copyWith(isActive: true));
  }

  void pause() {
    if (!state.isActive) return;
    emit(state.copyWith(isActive: false));
  }

  void toggle() {
    emit(state.copyWith(isActive: !state.isActive));
  }

  void startOrReset() {
    isPlaying ? reset() : start();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
