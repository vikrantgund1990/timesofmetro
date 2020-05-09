class RouteLine {
  String name;
  String color;

  RouteLine.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        color = map["color"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}
