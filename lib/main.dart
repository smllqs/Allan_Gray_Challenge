import 'package:app_load_testing_ag/world_time_view.dart';
import 'package:flutter/material.dart';

import 'choose_location.dart';
import 'home.dart';
import 'loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/world_time_view' : (context) => const WorldTimeView(),
    '/location': (context) => const ChooseLocation()
  },
));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Http Test',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// HomePage()
// ChooseLocation()
// WorldTimeView()
// Loading()

// import 'package:flutter/material.dart';
// import 'package:world_time/Pages/choose_location.dart';
// import 'package:world_time/Pages/home.dart';
// import 'package:world_time/Pages/loading.dart';
// void main() => runApp(MaterialApp(
//   initialRoute: '/',
//   routes: {
//     '/': (context) => Loading(),
//     '/home' : (context) => Home(),
//     '/location': (context) => ChooseLocation()
//   },
// ));
