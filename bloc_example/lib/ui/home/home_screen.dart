import 'package:bloc_example/data/models/home.dart';
import 'package:bloc_example/shared/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/shared/Constants.dart' as Constants;
import 'blocs/home_bloc.dart';

class HomeScreen extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    final bloc = HomeBloc();

    return BlocProvider<HomeBloc>(
      bloc: bloc,
      child: Scaffold(
      appBar: AppBar(
        title: Text('BLoC Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _buildRooms(bloc),
            )
          ],
        ),
      ),
    ));
  }

   Widget _buildRooms(HomeBloc bloc) {
    bloc.fetchRooms();

    return StreamBuilder<List<Room>>(
      stream: bloc.roomsStream,
      builder: (context, snapshot) {
        final roomList = snapshot.data;

        if (roomList == null) {
          return Center(child: Text(Constants.requestRoomsError));
        }

        return _buildRoomList(roomList);
      },
    );
  }

  Widget _buildRoomList(List<Room> rooms) {
    return ListView.separated(
      itemCount: rooms.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final room = rooms[index];
        return ListTile(
          title: Text(room.name)
        );
      },
    );
  }
}

