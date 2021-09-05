import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:suitmedia_first_phase/controller/event_list_controller.dart';
import 'package:suitmedia_first_phase/controller/guest_list_controller.dart';
import 'package:suitmedia_first_phase/controller/home_controller.dart';
import 'package:suitmedia_first_phase/model/guest.dart';
import 'package:suitmedia_first_phase/pages/home.dart';

void main() {
  runApp(MyApp());
}

Future _openBoxInit() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(GuestAdapter());
  await Hive.openBox<Guest>('guest');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Suitmedia Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),
      initialBinding: BindingsBuilder(() => {
            Get.put(HomeController()),
            Get.put(EventListController()),
            Get.put(GuestListController())
          }),
      home: FutureBuilder(
        future: _openBoxInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          }
          return Scaffold();
        },
      ),
    );
  }
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
