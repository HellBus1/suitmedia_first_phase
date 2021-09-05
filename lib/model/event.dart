class Event {
  final String image;
  final String name;
  final DateTime date;
  final double latitude;
  final double longitude;

  Event(
      {required this.image,
      required this.name,
      required this.date,
      required this.latitude,
      required this.longitude});

  Map<String, dynamic> toMap() => {'image': image, 'name': name, 'date': date};
}
