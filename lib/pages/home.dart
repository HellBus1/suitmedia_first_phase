import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePage();
  }
}

class _StatePage extends State<HomeScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // final provider = Provider.of<MainProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                        controller: _controller,
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
                              // showAlertDialog(context, provider);
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

  showAlertDialog(BuildContext context, provider) {
    // set up the button
    // Widget okButton = TextButton(
    //     onPressed: () {
    //       Navigator.of(context, rootNavigator: true).pop('dialog');
    //     },
    //     child: Text(
    //       "Close",
    //       style: TextStyle(color: Colors.blue),
    //     ));

    // Widget checkButton = TextButton(
    //     onPressed: () {
    //       Navigator.of(context, rootNavigator: true).pop('dialog');
    //       provider.setName(_controller.text);
    //       Navigator.pushNamed(context, '/event/choose');
    //     },
    //     child: Text(
    //       "Lanjut",
    //       style: TextStyle(color: Colors.blue),
    //     ));

    // // set up the AlertDialog
    // AlertDialog alert = AlertDialog(
    //   title: Text("Peringatan", style: TextStyle(color: Colors.red)),
    //   content: Text((_controller.text != "")
    //       ? (isPalindrome() ? "Palindrom" : "Bukan Palindrom")
    //       : ("Nama tidak boleh kosong")),
    //   actions: [okButton, (_controller.text != "") ? checkButton : Container()],
    // );

    // // show the dialog
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );
  }

  isPalindrome() {
    String inputtext = _controller.text;
    String buffer = _controller.text;
    String reversedinputtext =
        String.fromCharCodes(buffer.runes.toList().reversed);
    print(reversedinputtext);
    return inputtext == reversedinputtext;
  }
}
