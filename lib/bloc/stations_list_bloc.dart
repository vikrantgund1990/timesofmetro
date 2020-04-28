import 'dart:async';

import 'package:timesofmetro/bloc/bloc.dart';
import 'package:timesofmetro/model/station.dart';
import 'package:timesofmetro/network/api_provider.dart';

class StationListBloc implements Bloc {
  APIProvider provider = APIProvider();
  final _controller = StreamController<List<Station>>();

  Stream<List<Station>> get stationStream => _controller.stream;

  fetchStationList() async {
    try {
      List<Station> stations = await provider.fetchStationList();
      _controller.sink.add(stations);
    } catch (e) {
      _controller.addError(e);
    }
  }

  @override
  void dispose() {
    _controller.close();
  }

}
