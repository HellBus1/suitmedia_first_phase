import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:suitmedia_first_phase/constant.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:latlong2/latlong.dart';

class MapViewComponent extends StatelessWidget {
  final EventListController getXController = Get.put(EventListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              return ActionChip(
                  onPressed: () {
                    getXController.setLatlong(
                        eventList[index].latitude, eventList[index].longitude);
                    getXController.setEventName(eventList[index].name);
                  },
                  label: Text(eventList[index].name));
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Obx(
          () => Text(getXController.eventName.value),
        ),
        Expanded(child: Container())
      ],
    );

    // for (var item in eventList)
  }
}
