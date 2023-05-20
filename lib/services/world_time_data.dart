import 'package:app_load_testing_ag/services/http_stats.dart';
import 'package:http/http.dart';
// import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeData {
  late String url;
  late String time;
  late String location;
  late String flag;
  late bool isDaytime;
  late HttpStats httpStats;

  WorldTimeData(
      {required this.url, required this.location, required this.flag});

  Future<void> getTime() async {
    try {
      // Measuring time it takes for the http request complete.
      DateTime start = DateTime.now();
      Stopwatch stopwatch = Stopwatch()..start();
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      int duration = stopwatch.elapsed.inMilliseconds;
      DateTime finish = DateTime.now();
      int bytes = response.bodyBytes.length;

      httpStats = HttpStats(
          duration: duration, start: start, end: finish, bytes: bytes);

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);

      now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = (now.hour > 6 && now.hour < 19);
      time = DateFormat.jm().format(now);
    } catch (e) {
      // print("caught error: $e");
      time = "Could not get time data";
    }
  }
}
