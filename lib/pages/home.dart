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
    return Consumer<MainProvider>(builder: (context, provider, child) {
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
              "images/bg_validation.png",
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
                          "images/btn_add_photo.png",
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
                                if (_controller.text != "") {
                                  provider.setName(_controller.text);
                                  Navigator.pushNamed(context, '/event/choose');
                                } else {
                                  showAlertDialog(context);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 54,
                                    bottom: MediaQuery.of(context).size.height /
                                        54),
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
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
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
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.blue),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Peringatan", style: TextStyle(color: Colors.red)),
      content: Text("Nama tidak boleh kosong"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
