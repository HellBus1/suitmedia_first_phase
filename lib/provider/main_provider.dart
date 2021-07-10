import 'package:flutter/widgets.dart';

class MainProvider extends ChangeNotifier {
  String name;

  setName(name) {
    this.name = name;
    notifyListeners();
  }
}
