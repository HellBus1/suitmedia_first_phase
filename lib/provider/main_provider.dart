import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:suitmedia_first_phase/model/event.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_first_phase/model/guest.dart';

class MainProvider extends ChangeNotifier {
  String name;
  Event event;
  Guest guest;
  bool loadingState = true;
  List guestList = [];
  String errorMessage = "";

  setName(name) {
    this.name = name;
    notifyListeners();
  }

  setEvent(event) {
    this.event = event;
    notifyListeners();
  }

  setGuest(guest) {
    this.guest = guest;
    notifyListeners();
  }

  Future<bool> getDummyGuest() async {
    loadingState = true;
    errorMessage = "";
    // notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('http://www.mocky.io/v2/596dec7f0f000023032b8017'));
      if (response.statusCode == 200) {
        guestList.clear();
        jsonDecode(response.body).forEach((data) {
          guestList.add(Guest.fromJson(data));
        });

        loadingState = false;
        errorMessage = "";
        notifyListeners();

        return true;
      } else {
        // throw Exception('Failed to load album');
        loadingState = false;
        errorMessage = "Failed to load ";
        notifyListeners();

        return false;
      }
    } catch (e) {
      print(e);
      loadingState = false;
      errorMessage = e.toString();
      notifyListeners();

      return false;
    }
  }
}
