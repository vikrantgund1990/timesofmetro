class Halts {
  String stnCode;
  String name;
  String duration;
  String time;
  bool isChangeRout;
  String lineColor;

  Halts({this.name, this.time, this.isChangeRout = false, this.lineColor});

  Halts.fromJsonMap(Map<String, dynamic> map)
      : stnCode = map["stnCode"],
        name = map["name"],
        duration = map["duration"],
        time = map["time"],
        isChangeRout = false;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stnCode'] = stnCode;
    data['name'] = name;
    data['duration'] = duration;
    data['time'] = time;
    return data;
  }
}
