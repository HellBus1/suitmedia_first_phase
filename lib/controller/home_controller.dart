import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  String name = "";

  void putName(String name) {
    this.name = name;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
