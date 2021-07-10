import 'package:flutter/widgets.dart';

class Guest {
  final int id;
  final String name;
  final String birthdate;

  Guest({@required this.id, @required this.name, @required this.birthdate});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
        id: json['id'], name: json['name'], birthdate: json['birthdate']);
  }
}
