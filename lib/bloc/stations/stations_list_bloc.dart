import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timesofmetro/bloc/stations/station_list_event.dart';
import 'package:timesofmetro/bloc/stations/station_list_state.dart';
import 'package:timesofmetro/model/station.dart';
import 'package:timesofmetro/network/api_provider.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class StationListBloc extends Bloc<StationListEvent, StationListStates> {
  List<Station> stations;
  APIProvider provider = APIProvider();

  @override
  StationListStates get initialState => StationListInitialState();

  @override
  Stream<StationListStates> mapEventToState(StationListEvent event) async* {
    if (event is FetchStationList) {
      yield StationListLoadingState();
      try {
        stations = await provider.fetchStationList();
        yield StationListLoadedState(stations);
      } catch (e) {
        yield StationListErrorState(StringResources.errorException);
      }
    }
  }
}
