import 'package:equatable/equatable.dart';

abstract class MetroListEvent extends Equatable {}

class StartMetroTimer extends MetroListEvent {
  final int miliseconds;

  StartMetroTimer(this.miliseconds);

  @override
  // TODO: implement props
  List<Object> get props => [miliseconds];
}

class Tick extends MetroListEvent {
  final String time;

  Tick(this.time);

  @override
  // TODO: implement props
  List<Object> get props => [time];
}

class RefreshMetroList extends MetroListEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
