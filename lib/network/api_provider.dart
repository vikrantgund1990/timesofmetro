import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:timesofmetro/model/station.dart';

class APIProvider {
  final _baseUrl =
      'https://egycf89qx5.execute-api.ap-south-1.amazonaws.com/dev/api';
  Client _client;
  static final int SUCCESS = 200;
  static final APIProvider provider = APIProvider._getInstance();

  factory APIProvider() {
    return provider;
  }

  APIProvider._getInstance() {
    _client = Client();
  }

  Future<List<Station>> fetchStationList() async {
    final response = await _client.get('$_baseUrl/routes/test1');
    if (response.statusCode == SUCCESS) {
      var parseJson = json.decode(response.body);
      var list = parseJson['data'] as List;
      List<Station> stations =
          list.map((data) => Station.fromJson(data)).toList();
      return stations;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
