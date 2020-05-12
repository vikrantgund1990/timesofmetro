import 'package:bloc/bloc.dart';
import 'package:quiver/async.dart';
import 'package:timesofmetro/bloc/metro/timer_event.dart';
import 'package:timesofmetro/bloc/metro/timer_state.dart';

class MetroTimerBloc extends Bloc<TimerEvent, TimerState> {
  var sub;

  @override
  TimerState get initialState => TimerInitialState();

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is StartMetroTimer) {
      yield* startTimer(event.miliseconds);
    }
    if (event is Tick) {
      yield MetroTimerBeginState(event.time);
    }
    if (event is Finished) {
      yield MetroTimerFinishState();
    }
  }

  Stream<TimerState> startTimer(var miliSecond) async* {
    String _timeString = "00:00:00";
    DateTime next = DateTime.fromMillisecondsSinceEpoch(miliSecond);
    DateTime now = DateTime.now();
    Duration d = next.difference(now);
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: d.inSeconds),
      new Duration(seconds: 1),
    );

    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      now = DateTime.now();
      int hh = duration.remaining.inHours % 60;
      int mm = duration.remaining.inMinutes % 60;
      int ss = duration.remaining.inSeconds % 60;

      _timeString =
          "${hh.toString().padLeft(2, '0')}:${mm.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}";
      print(_timeString);
      add(Tick(_timeString));
    });
    sub.onDone(() {
      sub.cancel();
      add(Finished());
    });
  }
}
