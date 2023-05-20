import 'package:app_load_testing_ag/widgets/big_text.dart';
import 'package:flutter/material.dart';

class WorldTimeView extends StatefulWidget {
  const WorldTimeView({Key? key}) : super(key: key);

  @override
  State<WorldTimeView> createState() => _WorldTimeViewState();
}

class _WorldTimeViewState extends State<WorldTimeView> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'daytime.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.grey : Colors.black12;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: BigText(
          text: "World Time Data",
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () async {
              dynamic result =
                  await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'flag': result['flag'],
                  'isDaytime': result['isDaytime']
                  // Also Retrieve the HttpStats Object Here
                };
              });
            },
            icon: Icon(
              Icons.edit_location,
              color: Colors.grey.shade300,
              size: 30.0,
            ),
            label: Text(
              'Edit Location',
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 17.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data['location'],
                style: const TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            data['time'],
            style: const TextStyle(
                fontSize: 30.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          )
        ],
      ),
        ),
      ),
    );
  }
}
