import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:suitmedia_first_phase/controller/guest_list_controller.dart';
import 'package:suitmedia_first_phase/controller/home_controller.dart';
import 'package:suitmedia_first_phase/pages/event_list.dart';
import 'package:suitmedia_first_phase/pages/guest_list.dart';

class EventChooserScreen extends StatelessWidget {
  final HomeController homeController = Get.find();
  final EventListController eventListController = Get.find();
  final GuestListController guestListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bg_validation.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 17,
                  right: MediaQuery.of(context).size.width / 17),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Nama :",
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: Obx(() => Text(
                                  homeController.name.value,
                                  style: TextStyle(
                                      letterSpacing: 1.2,
                                      color: Colors.white,
                                      fontSize: 20),
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 50),
                        child: OutlinedButton(
                            onPressed: () {
                              Get.to(EventListScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 54,
                                  bottom:
                                      MediaQuery.of(context).size.height / 54),
                              child: Obx(() => Text(
                                    eventListController.event.value.name != ""
                                        ? eventListController.event.value.name
                                        : "Pilih Event",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2),
                                  )),
                            ),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.white,
                                      width: 2)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              )),
                            )),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 50),
                        child: OutlinedButton(
                            onPressed: () async {
                              var result = await Get.to(GuestListScreen());
                              print(result);
                              if (result == "success") {
                                manageDialogContent();
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 54,
                                  bottom:
                                      MediaQuery.of(context).size.height / 54),
                              child: Obx(() => Text(
                                    guestListController.guest.value.name != ""
                                        ? guestListController.guest.value.name
                                        : "Pilih Guest",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2),
                                  )),
                            ),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.white,
                                      width: 2)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              )),
                            )),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  manageDialogContent() {
    var splitted = guestListController.guest.value.birthdate.split('-');
    var isPrime = primeChecker(int.parse(splitted[1]));

    if (int.parse(splitted[1]) % 2 == 0 && int.parse(splitted[1]) % 3 == 0) {
      showAlertDialog("iOS", isPrime, int.parse(splitted[1]));
    } else if (int.parse(splitted[1]) % 2 == 0) {
      showAlertDialog("blackberry", isPrime, int.parse(splitted[1]));
    } else if (int.parse(splitted[1]) % 3 == 0) {
      showAlertDialog("android", isPrime, int.parse(splitted[1]));
    } else {
      showAlertDialog("featured phone", isPrime, int.parse(splitted[1]));
    }
  }

  primeChecker(value) {
    if (value <= 1) {
      return false;
    }

    if (value == 2) {
      return true;
    }

    for (int i = 2; i <= sqrt(value); i++) {
      if (value % i == 0) {
        return false;
      }
    }

    return true;
  }

  showAlertDialog(String mob, bool isPrime, int month) {
    // set up the button
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(Get.overlayContext as BuildContext).pop();
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.blue),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Merk HP"),
      content: Text('$mob\n\n$month is prime? $isPrime'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    Get.dialog(alert);
  }
}
