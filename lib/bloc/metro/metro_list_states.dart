import 'package:equatable/equatable.dart';

abstract class MetroListStates extends Equatable {}

class MetroListInitialState extends MetroListStates {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MetroTimerBeginState extends MetroListStates {
  final String time;

  MetroTimerBeginState(this.time);

  @override
  // TODO: implement props
  List<Object> get props => [time];
}

class MetroTimerFinishState extends MetroListStates {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMetroListInitialState extends MetroListInitialState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMetroListLoadingState extends MetroListInitialState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMetroListLoadedState extends MetroListInitialState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RefreshMetroListErrorState extends MetroListInitialState {
  final String error;

  RefreshMetroListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
