import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'stopwach_state.dart';

class StopwachCubit extends Cubit<StopwachState> {
  StopwachCubit() : super(StopwatchInitial());

  bool isVisible = true;
  bool isNotVisible = false;
  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;
  String time = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  String StartButton = "Start";

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    time = swatch.elapsed.inHours.toString().padLeft(2, '0') +
        ":" +
        (swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ":" +
        (swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  void startWatch() {
    isVisible = !isVisible;
    isNotVisible = !isNotVisible;
    stopIsPressed = false;
    startIsPressed = false;
    swatch.start();
    startTimer();
    emit(
      StartWatchState(
        isVisible,
        isNotVisible,
        stopIsPressed,
        startIsPressed,
      ),
    );
  }

  void stopwatch() {
    stopIsPressed = true;
    resetIsPressed = false;
    isVisible = !isVisible;
    isNotVisible = !isNotVisible;
    swatch.stop();
    StartButton = "Restart";
    emit(
      StartWatchState(
        isVisible,
        isNotVisible,
        stopIsPressed,
        startIsPressed,
      ),
    );
  }

  void resetWatch() {
    startIsPressed = true;
    resetIsPressed = true;
    swatch.reset();
    time = "00:00:00";
    StartButton = "Start";
    emit(
      ResetWatchState(
        resetIsPressed,
        startIsPressed,
      ),
    );
  }
}
