part of 'stopwach_cubit.dart';

@immutable
abstract class StopwachState {}

class StopwatchInitial extends StopwachState {}

class StartWatchState extends StopwachState {
  final isVisible;
  final isNotVisible;
  final stopIsPressed;
  final startIsPressed;

  StartWatchState(
    this.isVisible,
    this.isNotVisible,
    this.stopIsPressed,
    this.startIsPressed,
  );
}

class StopwatchState extends StopwachState {
  final isVisible;
  final isNotVisible;
  final stopIsPressed;
  final resetIsPressed;

  StopwatchState(
    this.isVisible,
    this.isNotVisible,
    this.stopIsPressed,
    this.resetIsPressed,
  );
}

class ResetWatchState extends StopwachState {
  final resetIsPressed;
  final startIsPressed;

  ResetWatchState(
    this.resetIsPressed,
    this.startIsPressed,
  );
}
