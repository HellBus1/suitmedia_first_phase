import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitmedia_first_phase/model/guest.dart';
import 'package:get/get.dart';

class GuestListController extends GetxController {
  bool guestLoadingState = false;
  var guestList = [].obs;
  String errorMessage = "";
  var guest = Guest(id: 1, name: "", birthdate: "").obs;
  Dio dio = Dio();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // Navigator.popAndPushNamed(context, '/guest/list');
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  setGuestLoadingState(bool state) {
    this.guestLoadingState = state;
    update();
  }

  setErrorMessage(String message) {
    this.errorMessage = message;
    update();
  }

  Future<void> _fetchGuests() async {
    try {
      final response =
          await dio.get("http://www.mocky.io/v2/596dec7f0f000023032b8017");
      if (response.statusCode == 200) {
        guestList.clear();

        var box = Hive.box<Guest>('guest');
        if (box.length >= 1) {
          await box.clear();
        }
        for (var tempJson in response.data) {
          box.add(Guest.fromJson(tempJson));
        }
      }
    } catch (e) {
      debugPrint("Fecth guest error -- onCatch ${e.toString()}");
    }
  }

  setGuest(Guest guest) {
    this.guest.value = guest;
    update();
  }

  @override
  void onInit() async {
    await Hive.openBox<Guest>('guest');
    _fetchGuests();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
