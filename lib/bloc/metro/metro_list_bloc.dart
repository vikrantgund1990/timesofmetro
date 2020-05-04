import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quiver/async.dart';
import 'package:timesofmetro/bloc/metro/metro_list_event.dart';
import 'package:timesofmetro/bloc/metro/metro_list_states.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class MetroListBloc extends Bloc<MetroListEvent, MetroListStates> {
  var sub;

  Stream<MetroListStates> startTimer(var miliSecond) async* {
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
    });
  }

  @override
  Future<void> close() {
    sub.cancel();
    return super.close();
  }

  @override
  MetroListStates get initialState => MetroListInitialState();

  @override
  Stream<MetroListStates> mapEventToState(MetroListEvent event) async* {
    if (event is StartMetroTimer) {
      yield* startTimer(event.miliseconds);
    }
    if (event is Tick) {
      yield MetroTimerBeginState(event.time);
    }
    if (event is RefreshMetroList) {
      yield RefreshMetroListLoadingState();
      try {} catch (e) {
        yield RefreshMetroListErrorState(StringResources.errorException);
      }
    }
  }
}
