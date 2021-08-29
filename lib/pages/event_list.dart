import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/constant.dart';
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
  String pageState = "eventlist";
  // eventmap

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
        child: DefaultTabController(
          length: (this.pageState == "eventmap") ? eventList.length : 0,
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
              // bottom: (this.pageState == "eventmap")
              //     ? TabBar(
              //         isScrollable: true,
              //         unselectedLabelColor: Colors.white.withOpacity(0.3),
              //         indicatorColor: Colors.blue,
              //         tabs: [
              //             for (var item in eventList)
              //               Tab(
              //                   child: Container(
              //                 width: 200,
              //                 child: RichText(
              //                   text: TextSpan(
              //                     text: item.name ?? "",
              //                     style: TextStyle(color: Colors.black),
              //                   ),
              //                   maxLines: 1,
              //                   textAlign: TextAlign.center,
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ))
              //           ])
              //     : PreferredSize(
              //         preferredSize: Size.fromHeight(1),
              //         child: Container(),
              //       ),
              actions: [
                IconButton(
                    onPressed: () {
                      this.setState(() {
                        this.pageState = 'eventmap';
                      });
                    },
                    icon: Icon(Icons.plus_one)),
                IconButton(
                    onPressed: () {
                      this.setState(() {
                        this.pageState = 'eventlist';
                      });
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
              child: (this.pageState == "eventlist")
                  ? EventListComponent(provider: provider)
                  : MapViewComponent(provider: provider),
            ),
          ),
        ),
      );
    });
  }
}
