class Station {
  String name;
  String id;
  String stationCode;

  Station({this.name, this.id, this.stationCode});

  factory Station.fromJson(Map<String, dynamic> parsedJson){
    return Station(
        name: parsedJson['name'],
        //id : parsedJson['id'],
        stationCode: parsedJson['stnCode']
    );
  }
}
