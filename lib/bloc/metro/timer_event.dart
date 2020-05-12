import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {}

class StartMetroTimer extends TimerEvent {
  final int miliseconds;

  StartMetroTimer(this.miliseconds);

  @override
  List<Object> get props => [miliseconds];
}

class Tick extends TimerEvent {
  final String time;

  Tick(this.time);

  @override
  List<Object> get props => [time];
}

class Finished extends TimerEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
