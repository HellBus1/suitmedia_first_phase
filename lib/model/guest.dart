import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'guest.g.dart';

@HiveType(typeId: 0)
class Guest extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String birthdate;

  Guest({required this.id, required this.name, required this.birthdate});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
        id: json['id'], name: json['name'], birthdate: json['birthdate']);
  }
}
