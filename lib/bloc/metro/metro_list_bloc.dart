import 'dart:async';

import 'package:quiver/async.dart';
import 'package:timesofmetro/bloc/bloc.dart';

class MetroListBloc extends Bloc {
  String _timeString = "00:00:00";
  final _timeController = StreamController<String>();

  Stream<String> get timeStream => _timeController.stream;

  void startTimer(var miliSecond) {
    DateTime next = DateTime.fromMillisecondsSinceEpoch(miliSecond);
    DateTime now = DateTime.now();
    Duration d = next.difference(now);
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: d.inSeconds),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      now = DateTime.now();
      int hh = duration.remaining.inHours % 60;
      int mm = duration.remaining.inMinutes % 60;
      int ss = duration.remaining.inSeconds % 60;

      _timeString =
          "${hh.toString().padLeft(2, '0')}:${mm.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}";
      print(_timeString);
      if (_timeController.isClosed) {
        sub.cancel();
      }
      _timeController.sink.add(_timeString);
    });

    sub.onDone(() {
      sub.cancel();
    });
  }

  @override
  void dispose() {
    _timeController.close();
  }
}
