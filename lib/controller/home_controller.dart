import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textcontroller;
  RxString name = "".obs;

  @override
  void onInit() {
    textcontroller = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textcontroller.dispose();
    super.onClose();
  }

  setName() {
    this.name.value = textcontroller.text;
    update();
  }
}
