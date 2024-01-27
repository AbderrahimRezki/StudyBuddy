import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/constants/time_constants.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/states/pomodoro_state.dart';
import 'package:study_buddy/features/userprofile/bloc/user_cubit.dart';

const initialState = PomodoroInitialState(
    totalTime: thirtyMinutes,
    restTime: fiveMinutes,
    remainingTime: thirtyMinutes,
    completedSessions: 0);

class PomodoroCubit extends Cubit<PomodoroState> {
  Timer? _timer;

  PomodoroCubit() : super(initialState) {
    _timer = Timer.periodic(oneSecond, update);
  }

  void start() {
    if (state.isActive) return;
    emit(initialState.copyWith(isActive: true));
  }

  void reset() {
    if (!state.isActive) return;
    emit(initialState.copyWith(isActive: false));
  }

  void pause() {
    emit(state.copyWith(isActive: false));
  }

  void resume() {
    emit(state.copyWith(isActive: true));
  }

  void toggle() {
    emit(state.copyWith(isActive: !state.isActive));
  }

  void startOrReset() {
    if (_timer == null) return;
    state.isActive ? reset() : start();
  }

  void update(timer) {
    if (!state.isActive) return;

    Duration remaining = state.remainingTime - oneSecond;

    if (!remaining.isNegative) {
      emit(state.copyWith(remainingTime: remaining));
      return;
    }

    if (!state.isRestTime) {
      locator<UserCubit>().updateUserProgress(delta: 10);
    }

    emit(state.copyWith(
        totalTime: state.isRestTime ? thirtyMinutes : fiveMinutes,
        remainingTime: state.isRestTime ? thirtyMinutes : fiveMinutes,
        completedSessions: state.isRestTime
            ? state.completedSessions
            : state.completedSessions + 1,
        isRestTime: !state.isRestTime));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
