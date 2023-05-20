import 'package:flutter/material.dart';
import 'package:app_load_testing_ag/world_time_view.dart';
import 'choose_location.dart';
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

