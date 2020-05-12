import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {}

class TimerInitialState extends TimerState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MetroTimerBeginState extends TimerState {
  final String time;

  MetroTimerBeginState(this.time);

  @override
  List<Object> get props => [time];
}

class MetroTimerFinishState extends TimerState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
