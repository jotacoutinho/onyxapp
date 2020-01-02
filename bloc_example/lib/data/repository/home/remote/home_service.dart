import 'dart:async';
import 'dart:convert' show json;
import 'package:bloc_example/data/models/home.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_example/shared/Config.dart' as Config;

class HomeService {
  final _endPoint = '/home';
  Map<String, String> get _headers =>
      {'Content-Type': 'application/json'};

  Future<List<Room>> fetchRooms() async {
    http.Response results = await http.get(Config.baseUrl + _endPoint, headers: _headers);

    if (results.statusCode == 200) {
      return parseRooms(results.body);
    } else {
      print('Error! statusCode ${results.statusCode}');
      return null;
    }
  }

  List<Room> parseRooms(String response) {
    final home = json.decode(response);
    final rooms = home['rooms'].map<Room>((json) => Room.fromJson(json)).toList();

    return rooms;
  }
}