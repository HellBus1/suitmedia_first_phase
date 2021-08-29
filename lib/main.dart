import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_first_phase/pages/event_chooser.dart';
import 'package:suitmedia_first_phase/pages/event_list.dart';
import 'package:suitmedia_first_phase/pages/guest_list.dart';
import 'package:suitmedia_first_phase/pages/home.dart';
import 'package:suitmedia_first_phase/pages/testingpage.dart';
import 'package:suitmedia_first_phase/provider/main_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: 'Suitmedia Demo',
    //   theme: ThemeData(
    //     primarySwatch: white,
    //   ),
    //   home: TestingPage(),
    // );

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (c) => MainProvider())],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: white,
          ),
          routes: {
            '/event/choose': (context) => EventChooserScreen(),
            '/event/list': (context) => EventListScreen(),
            '/guest/list': (context) => GuestListScreen(),
          },
          home: EventListScreen(),
        ));
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
