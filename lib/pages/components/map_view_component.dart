import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:suitmedia_first_phase/constant.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';
import "package:latlong/latlong.dart" as latLng;

class MapViewComponent extends StatefulWidget {
  final MainProvider provider;

  MapViewComponent({@required this.provider});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MapViewComponent> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      for (var item in eventList)
        FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(item.latitude, item.longitude),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(item.latitude, item.longitude),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    ]);
  }
}
