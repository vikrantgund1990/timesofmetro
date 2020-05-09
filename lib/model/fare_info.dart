class FareInfo {
  int adult;
  int child;

  FareInfo.fromJsonMap(Map<String, dynamic> map)
      : adult = map["adult"],
        child = map["child"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['child'] = child;
    return data;
  }
}
