import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';

class EventChooserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePage();
  }
}

class _StatePage extends State<EventChooserScreen> {
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
                              child: Text(
                                provider.name ?? "",
                                style: TextStyle(
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.left,
                              ),
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
                                Navigator.pushNamed(context, '/event/list');
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 54,
                                    bottom: MediaQuery.of(context).size.height /
                                        54),
                                child: Text(
                                  provider.event != null
                                      ? provider.event.name
                                      : "Pilih Event",
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
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 50),
                          child: OutlinedButton(
                              onPressed: () async {
                                var result = await Navigator.pushNamed(
                                    context, '/guest/list');
                                if (result == "success") {
                                  manageDialogContent(provider);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 54,
                                    bottom: MediaQuery.of(context).size.height /
                                        54),
                                child: Text(
                                  provider.guest != null
                                      ? provider.guest.name
                                      : "Pilih Guest",
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

  manageDialogContent(provider) {
    if (provider.guest != null) {
      var splitted = provider.guest.birthdate.split('-');
      print("splits " + splitted[1]);
      if (int.parse(splitted[1]) % 2 == 0 && int.parse(splitted[1]) % 3 == 0) {
        showAlertDialog(context, "iOS");
      } else if (int.parse(splitted[1]) % 2 == 0) {
        showAlertDialog(context, "blackberry");
      } else if (int.parse(splitted[1]) % 3 == 0) {
        showAlertDialog(context, "android");
      } else {
        showAlertDialog(context, "featured phone");
      }
    }
  }

  showAlertDialog(BuildContext context, String mob) {
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
      title: Text("Merk HP"),
      content: Text(mob),
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
