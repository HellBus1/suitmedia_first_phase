import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:suitmedia_first_phase/controller/guest_list_controller.dart';

class TestingPage extends StatelessWidget {
  final GuestListController _guestListController =
      Get.put(GuestListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Obx(() => Text(
                    _guestListController.guestList.length.toString(),
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
