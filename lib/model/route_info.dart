import 'halts.dart';

class RouteInfo {
  List<Halts> halts;
  int haltsCount;

  RouteInfo.fromJsonMap(Map<String, dynamic> map)
      : halts =
            List<Halts>.from(map["halts"].map((it) => Halts.fromJsonMap(it))),
        haltsCount = map["haltsCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['halts'] =
        halts != null ? this.halts.map((v) => v.toJson()).toList() : null;
    data['haltsCount'] = haltsCount;
    return data;
  }
}
