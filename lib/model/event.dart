import 'package:meta/meta.dart';

class Event {
  final String image;
  final String name;
  final DateTime date;

  Event({@required this.image, @required this.name, @required this.date});

  Map<String, dynamic> toMap() => {'image': image, 'name': name, 'date': date};
}
