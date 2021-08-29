import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class EventListController extends GetxController {
  var pageState = "eventlist".obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var eventName = "".obs;
  //   latitude: -6.200000,
  // longitude: 106.816666

  setLatlong(double latitude, double longitude) {
    this.latitude.value = latitude;
    this.longitude.value = longitude;
    update();
  }

  setEventName(String value) {
    this.eventName.value = value;
    update();
  }

  setPageName(String pageName) {
    this.pageState.value = pageName;
    update();
  }
  // eventlist
}
