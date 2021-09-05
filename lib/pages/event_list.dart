import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:suitmedia_first_phase/pages/components/event_list_component.dart';
import 'package:suitmedia_first_phase/pages/components/map_view_component.dart';

class EventListScreen extends StatelessWidget {
  final EventListController getXController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/btn_backArticle_normal.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text("Event",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          actions: [
            IconButton(
                onPressed: () {
                  getXController.setPageName("eventmap");
                },
                icon: Icon(Icons.plus_one)),
            IconButton(
                onPressed: () {
                  getXController.setPageName("eventlist");
                },
                icon: Icon(Icons.backspace))
          ],
        ),
        body: Container(
            margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25),
            child: Obx(() {
              if (getXController.pageState.value == "eventlist") {
                return EventListComponent();
              }
              return MapViewComponent();
            })),
      ),
    );
  }
}
