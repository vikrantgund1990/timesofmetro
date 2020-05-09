import 'package:timesofmetro/model/source.dart';

import 'destination.dart';
import 'route_details.dart';

class MetroInfo {
  Source source;
  Destination destination;
  int changeCount;
  List<RouteDetails> details;

  MetroInfo.fromJsonMap(Map<String, dynamic> map)
      : source = Source.fromJsonMap(map["source"]),
        destination = Destination.fromJsonMap(map["destination"]),
        changeCount = map["changeCount"],
        details = List<RouteDetails>.from(
            map["details"].map((it) => RouteDetails.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = source == null ? null : source.toJson();
    data['destination'] = destination == null ? null : destination.toJson();
    data['changeCount'] = changeCount;
    data['details'] =
        details != null ? this.details.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
