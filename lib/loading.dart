import 'package:app_load_testing_ag/services/world_time_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';
  // setuWorldTime() procedure
  void setupWorldTime() async{
    // Setting default time zone
    WorldTimeData base = WorldTimeData(url: 'Africa/Johannesburg', location: 'Jo\'burg', flag: 'SA.png');
    await base.getTime();
    // setState(() {
    //   time = jhb.time;
    // });
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/world_time_view', arguments: {
        'time' : base.time,
        'location' : base.location,
        'flag' : base.flag,
        'isDaytime' : base.isDaytime,
        'httpStats' : base.httpStats
      });
    }else{
      Navigator.of(context).pop();
    }

  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.grey.shade500,
          size: 50.0,
        ),
      ),
    );
  }
}
