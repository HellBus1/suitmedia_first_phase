import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GuestListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePage();
  }
}

class _StatePage extends State<GuestListScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _initialState();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.popAndPushNamed(context, '/guest/list');
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  _initialState() {
    final provider = Provider.of<MainProvider>(context, listen: false);
    provider.checkConnection().then((value) {
      if (value) {
        provider.getDummyGuest().then((value) {});
      } else {
        provider.getFileReadAllData().then((value) {});
      }
    });
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
        child: (provider.loadingState)
            ? Scaffold(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                body: Center(
                  child: (provider.errorMessage != "")
                      ? Text(
                          provider.errorMessage,
                          textAlign: TextAlign.center,
                        )
                      : CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                ),
              )
            : Scaffold(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: Container(
                      margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: MediaQuery.of(context).size.width / 25,
                          right: MediaQuery.of(context).size.width / 25),
                      child: GridView.count(
                        crossAxisCount: 2,
                        children:
                            List.generate(provider.guestList.length, (index) {
                          final item = provider.guestList[index];
                          return GestureDetector(
                            onTap: () {
                              provider.setGuest(item);
                              Navigator.pop(context, "success");
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
                      )),
                ),
              ),
      );
    });
  }
}
