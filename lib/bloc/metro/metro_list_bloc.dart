import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timesofmetro/bloc/metro/metro_list_event.dart';
import 'package:timesofmetro/bloc/metro/metro_list_states.dart';
import 'package:timesofmetro/model/metro_info.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class MetroListBloc extends Bloc<MetroListEvent, MetroListStates> {

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  MetroListStates get initialState => MetroListInitialState();

  @override
  Stream<MetroListStates> mapEventToState(MetroListEvent event) async* {
    if (event is RefreshMetroList) {
      yield RefreshMetroListLoadingState();
      try {
        yield* _refreshMetroList(event.metroInfo);
      } catch (e) {
        yield RefreshMetroListErrorState(StringResources.errorException);
      }
    }
  }

  Stream<MetroListStates> _refreshMetroList(List<MetroInfo> metroInfo) async* {
    DateTime now = DateTime.now().add(Duration(seconds: 10));
    List<MetroInfo> filteredList = [];
    for (int i = 0; i < metroInfo.length; i++) {
      DateTime metroStartTime = DateTime.fromMillisecondsSinceEpoch(
          metroInfo[i].details[0].route.startTimeMsec);
      if (metroStartTime.isAfter(now)) {
        filteredList.add(metroInfo[i]);
      }
    }
    if (filteredList.isEmpty) {
      yield RefreshMetroListEmptyState();
    } else {
      yield RefreshMetroListLoadedState(filteredList);
    }
  }
}
