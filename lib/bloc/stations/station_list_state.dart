import 'package:equatable/equatable.dart';
import 'package:timesofmetro/model/station.dart';

abstract class StationListStates extends Equatable {}

class StationListInitialState extends StationListStates {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class StationListLoadingState extends StationListStates {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class StationListLoadedState extends StationListStates {
  final List<Station> stations;

  StationListLoadedState(this.stations);

  @override
  List<Object> get props => [stations];
}

class StationListErrorState extends StationListStates {
  final String error;

  StationListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
