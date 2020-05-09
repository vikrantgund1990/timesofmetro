class Destination {
  String stnCode;
  String name;

  Destination.fromJsonMap(Map<String, dynamic> map)
      : stnCode = map["stnCode"],
        name = map["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stnCode'] = stnCode;
    data['name'] = name;
    return data;
  }
}
