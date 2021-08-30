import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/controller/home_controller.dart';
import 'package:suitmedia_first_phase/pages/event_chooser.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

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
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 17,
                  right: MediaQuery.of(context).size.width / 17),
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Selamat Datang!",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Sertakan gambar profil Anda",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "untuk melengkapi profil.",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/btn_add_photo.png",
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: homeController.textcontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Masukkan Nama',
                        ),
                        style: TextStyle(fontSize: 17.0, color: Colors.white),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        child: OutlinedButton(
                            onPressed: () {
                              showAlertDialog();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 54,
                                  bottom:
                                      MediaQuery.of(context).size.height / 54),
                              child: Text(
                                "Selesai",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2),
                              ),
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
            )),
          )
        ],
      ),
    );
  }

  showAlertDialog() {
    // set up the button
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(Get.overlayContext).pop();
        },
        child: Text(
          "Close",
          style: TextStyle(color: Colors.blue),
        ));

    Widget checkButton = TextButton(
        onPressed: () {
          Navigator.of(Get.overlayContext).pop();
          homeController.setName();
          Get.to(EventChooserScreen());
        },
        child: Text(
          "Lanjut",
          style: TextStyle(color: Colors.blue),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Peringatan", style: TextStyle(color: Colors.red)),
      content: Text((homeController.textcontroller.text != "")
          ? (isPalindrome() ? "Palindrom" : "Bukan Palindrom")
          : ("Nama tidak boleh kosong")),
      actions: [
        okButton,
        (homeController.textcontroller.text != "") ? checkButton : Container()
      ],
    );

    // // show the dialog
    Get.dialog(alert);
  }

  isPalindrome() {
    String inputtext = homeController.textcontroller.text;
    String buffer = homeController.textcontroller.text;
    String reversedinputtext =
        String.fromCharCodes(buffer.runes.toList().reversed);
    print(reversedinputtext);
    return inputtext == reversedinputtext;
  }
}
