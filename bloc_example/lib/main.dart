import 'package:flutter/material.dart';
import 'data/models/home.dart';
import 'shared/blocs/bloc_provider.dart';
import 'ui/home/blocs/home_bloc.dart';
import 'ui/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      )
    );
  }
}
