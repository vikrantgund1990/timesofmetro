import 'package:equatable/equatable.dart';
import 'package:timesofmetro/model/metro_info.dart';

abstract class MetroListStates extends Equatable {}

class MetroListInitialState extends MetroListStates {
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

  final List<MetroInfo> filteredList;

  RefreshMetroListLoadedState(this.filteredList);

  @override
  List<Object> get props => [filteredList];
}

class RefreshMetroListEmptyState extends MetroListInitialState {

  @override
  List<Object> get props => null;
}

class RefreshMetroListErrorState extends MetroListInitialState {
  final String error;

  RefreshMetroListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
