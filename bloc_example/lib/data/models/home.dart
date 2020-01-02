import 'package:flutter/material.dart';

class Home {
  final List<Room> rooms;

  Home.fromJson(Map json)
      : rooms = json['rooms'];
}

class Room {
  final int id;
  final String name;
  final String type;
  final List<String> imagesUrls;

  Room.fromJson(Map json)
      : id = json['id'],
      name = json['name'],
      type = json['type'],
      imagesUrls = json['imagesUrl'];
}