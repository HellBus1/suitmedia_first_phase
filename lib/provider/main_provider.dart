import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:suitmedia_first_phase/model/event.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_first_phase/model/guest.dart';

class MainProvider extends ChangeNotifier {
  String name;
  Event event;
  Guest guest;
  bool loadingState = true;
  bool isConnected;
  List guestList = [];
  String errorMessage = "";
  final String fileName = "guests.json";

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
      writeToFile('');
      final response = await http
          .get(Uri.parse('http://www.mocky.io/v2/596dec7f0f000023032b8017'));
      if (response.statusCode == 200) {
        makeDataList(jsonDecode(response.body));
        writeToFile(response.body);
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

  writeToFile(value) async {
    String _filePath = await filePath();
    File userDocumentFile = File(_filePath);
    userDocumentFile?.writeAsStringSync(value);
  }

  Future<Directory> documentsPath() async {
    String tempPath = (await getApplicationDocumentsDirectory())?.path;
    return Directory("$tempPath").create();
  }

  Future<String> filePath() async {
    final path = (await documentsPath()).path;
    return "$path/$fileName";
  }

  Future<bool> getFileReadAllData() async {
    loadingState = true;
    errorMessage = "";

    try {
      String _filePath = await filePath();
      File userDocumentFile = File(_filePath);
      final data = await userDocumentFile?.readAsString();
      final jsonData = jsonDecode(data);

      if (jsonData != null) {
        makeDataList(jsonData);

        loadingState = false;
        errorMessage = "";
        notifyListeners();
        return true;
      } else {
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

  makeDataList(data) {
    guestList.clear();
    data.forEach((data) {
      guestList.add(Guest.fromJson(data));
    });
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      this.isConnected = true;
      notifyListeners();
      return true;
    }
    this.isConnected = false;
    notifyListeners();
    return true;
  }
}
