import 'package:timesofmetro/model/route_start.dart';

import 'route_end.dart';

class Route {
  RouteEnd end;
  String startTime;
  RouteStart start;
  String endTime;
  String journeyTime;
  int startTimeMsec;
  int endTimeMsec;

  Route.fromJsonMap(Map<String, dynamic> map)
      : end = RouteEnd.fromJsonMap(map["end"]),
        startTime = map["startTime"],
        start = RouteStart.fromJsonMap(map["start"]),
        endTime = map["endTime"],
        startTimeMsec = map["startTimeMsec"],
        endTimeMsec = map["endTimeMsec"],
        journeyTime = map["journeyTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = end == null ? null : end.toJson();
    data['startTime'] = startTime;
    data['start'] = start == null ? null : start.toJson();
    data['endTime'] = endTime;
    data['journeyTime'] = journeyTime;
    data['startTimeMsec'] = startTimeMsec;
    data['endTimeMsec'] = endTimeMsec;
    return data;
  }
}
