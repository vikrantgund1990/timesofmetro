import 'package:timesofmetro/model/route_start.dart';

import 'route_end.dart';

class Route {
  RouteEnd end;
  String startTime;
  RouteStart start;
  String endTime;
  String journeyTime;

  Route.fromJsonMap(Map<String, dynamic> map)
      : end = RouteEnd.fromJsonMap(map["end"]),
        startTime = map["startTime"],
        start = RouteStart.fromJsonMap(map["start"]),
        endTime = map["endTime"],
        journeyTime = map["journeyTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = end == null ? null : end.toJson();
    data['startTime'] = startTime;
    data['start'] = start == null ? null : start.toJson();
    data['endTime'] = endTime;
    data['journeyTime'] = journeyTime;
    return data;
  }
}
