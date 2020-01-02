import 'dart:async';
import 'package:bloc_example/data/models/home.dart';
import 'package:bloc_example/data/repository/home/remote/home_service.dart';
import 'package:bloc_example/shared/blocs/bloc.dart';

class HomeBloc implements Bloc {
  final _controller = StreamController<List<Room>>();
  final _service = HomeService();
  Stream<List<Room>> get roomsStream => _controller.stream;

  void fetchRooms() async {
    final results = await _service.fetchRooms();
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}