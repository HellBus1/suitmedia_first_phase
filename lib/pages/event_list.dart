import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/constant.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:suitmedia_first_phase/pages/components/event_list_component.dart';
import 'package:suitmedia_first_phase/pages/components/map_view_component.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';

class EventListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePage();
  }
}

class _StatePage extends State<EventListScreen> {
  // String pageState = "eventlist";
  EventListController getXController = Get.put(EventListController());

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
