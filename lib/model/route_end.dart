class RouteEnd {
  String stnCode;
  String name;
  int platform;

  RouteEnd.fromJsonMap(Map<String, dynamic> map)
      : stnCode = map["stnCode"],
        name = map["name"],
        platform = map["platform"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stnCode'] = stnCode;
    data['name'] = name;
    data['platform'] = platform;
    return data;
  }
}
