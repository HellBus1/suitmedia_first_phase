import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitmedia_first_phase/constant.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:suitmedia_first_phase/pages/event_chooser.dart';

class EventListComponent extends StatelessWidget {
  final EventListController eventListController =
      Get.put(EventListController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          final item = eventList[index];
          return GestureDetector(
            onTap: () {
              eventListController.setEvent(item);
              Get.off(EventChooserScreen());
            },
            child: Container(
              child: Card(
                elevation: 2,
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 15),
                      CachedNetworkImage(
                        imageUrl: item.image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              item.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              DateFormat('yyyy-MMMM-dd – kk:mm')
                                  .format(item.date),
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
