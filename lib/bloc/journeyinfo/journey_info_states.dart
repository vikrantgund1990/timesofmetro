import 'package:equatable/equatable.dart';

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
  bool success;

  JourneyLoadedState(this.success);

  @override
  // TODO: implement props
  List<Object> get props => [success];
}

class JourneyErrorState extends JourneyInfoStates {
  String error;

  JourneyErrorState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
