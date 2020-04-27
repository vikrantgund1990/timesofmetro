import 'dart:async';

import 'package:timesofmetro/bloc/bloc.dart';
import 'package:timesofmetro/model/station.dart';

class StationListBloc implements Bloc {
  final _controller = StreamController<List<Station>>();

  Stream<List<Station>> get stationStream => _controller.stream;

  void fetchStationList() {
    print("Station bloc");
  }

  @override
  void dispose() {
    _controller.close();
  }
}
