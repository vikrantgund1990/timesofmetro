import 'package:equatable/equatable.dart';
import 'package:timesofmetro/model/metro_info.dart';

abstract class JourneyInfoStates extends Equatable {}

class JourneyInfoInitialState extends JourneyInfoStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class JourneyLoadingState extends JourneyInfoStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class JourneyLoadedState extends JourneyInfoStates {
  final List<MetroInfo> metroInfo;

  JourneyLoadedState(this.metroInfo);

  @override
  List<Object> get props => [metroInfo];
}

class JourneyErrorState extends JourneyInfoStates {
  String error;

  JourneyErrorState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
