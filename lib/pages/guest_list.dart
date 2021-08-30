import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:suitmedia_first_phase/controller/guest_list_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:suitmedia_first_phase/model/guest.dart';

class GuestListScreen extends StatelessWidget {
  final GuestListController _getxController = Get.put(GuestListController());

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
            title: Text("Guest",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _getxController.refreshController,
            onRefresh: _getxController.onRefresh,
            onLoading: _getxController.onLoading,
            child: Container(
                margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 25,
                    right: MediaQuery.of(context).size.width / 25),
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<Guest>('guest').listenable(),
                  builder: (context, Box<Guest> box, _) {
                    if (box.values.isEmpty) {
                      return Center(
                        child: Text("No Guest"),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(box.length, (index) {
                        final item = box.getAt(index);
                        return GestureDetector(
                          onTap: () {
                            // provider.setGuest(item);
                            // Navigator.pop(context, "success");
                          },
                          child: Container(
                            child: Card(
                              elevation: 2,
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5),
                              child: Container(
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl:
                                            'https://qph.fs.quoracdn.net/main-qimg-6291c3a117fc230c82785148baef7eed'),
                                    ClipRRect(
                                      // Clip it cleanly.
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          color: Colors.grey.withOpacity(0.5),
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item.name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(item.birthdate,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                )
                // Obx(
                //   () =>
                // ),
                ),
          ),
        ));
  }
}
