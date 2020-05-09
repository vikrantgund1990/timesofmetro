import 'package:timesofmetro/model/route.dart';
import 'package:timesofmetro/model/route_info.dart';
import 'package:timesofmetro/model/route_line.dart';

import 'fare_info.dart';

class RouteDetails {
  int routeId;
  RouteLine routeLine;
  RouteInfo routeInfo;
  FareInfo fareInfo;
  Route route;

  RouteDetails.fromJsonMap(Map<String, dynamic> map)
      : routeId = map["routeId"],
        routeLine = RouteLine.fromJsonMap(map["routeLine"]),
        routeInfo = RouteInfo.fromJsonMap(map["routeInfo"]),
        fareInfo = FareInfo.fromJsonMap(map["fareInfo"]),
        route = Route.fromJsonMap(map["route"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routeId'] = routeId;
    data['routeLine'] = routeLine == null ? null : routeLine.toJson();
    data['routeInfo'] = routeInfo == null ? null : routeInfo.toJson();
    data['fareInfo'] = fareInfo == null ? null : fareInfo.toJson();
    data['route'] = route == null ? null : route.toJson();
    return data;
  }
}
