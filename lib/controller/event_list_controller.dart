import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:suitmedia_first_phase/model/event.dart';

class EventListController extends GetxController {
  var pageState = "eventlist".obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var event = Event(
          image: "",
          name: "",
          date: DateTime.now(),
          latitude: 0.0,
          longitude: 0.0)
      .obs;

  RxString eventName = "".obs;

  setLatlong(double latitude, double longitude) {
    this.latitude.value = latitude;
    this.longitude.value = longitude;
    update();
  }

  setEventName(String value) {
    this.eventName.value = value;
    update();
  }

  setEvent(event) {
    this.event.value = event;
    update();
  }

  setPageName(String pageName) {
    this.pageState.value = pageName;
    update();
  }
  // eventlist
}
