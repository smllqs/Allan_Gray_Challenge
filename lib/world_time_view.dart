import 'package:app_load_testing_ag/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

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
          color: Colors.grey.shade300,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
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
                      'isDaytime': result['isDaytime'],
                      'httpStats': result['httpStats']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey.shade300,
                  size: 30.0,
                ),
                label: BigText(
                  text: 'Edit Location',
                  color: Colors.grey.shade300,
                  letterspacing: 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BigText(
                    text: data['location'],
                    size: 25,
                    letterspacing: 2,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              BigText(
                text: data['time'],
                color: Colors.white,
                size: 40,
                letterspacing: 1,
                fontWeight: FontWeight.w700,
              ),
              // Http statistics block
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20)),
                  height: 420,
                  width: 350,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: 'http statistics',
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400,
                              letterspacing: 2,
                            )
                            ,
                        const SizedBox(
                          width: 5,
                        ),
                            Icon(
                              UniconsLine.analysis,
                              color: Colors.grey.shade500,
                              size: 25,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, right: 45),
                          child: Divider(
                            height: 12,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                // Response time display
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey.shade500,
                                  size: 45,
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BigText(
                                      text: "Response time :",
                                      fontWeight: FontWeight.w800,
                                      size: 17,
                                      letterspacing: 3,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    BigText(
                                      text:
                                          "${data['httpStats'].duration.toString()} milliseconds",
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    BigText(
                                      text: "Start:",
                                      fontWeight: FontWeight.w800,
                                      size: 17,
                                      letterspacing: 3,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    BigText(
                                      text:
                                          '${data['httpStats'].start.toString()}',
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    BigText(
                                      text: "Finished:",
                                      fontWeight: FontWeight.w800,
                                      size: 17,
                                      color: Colors.grey.shade500,
                                      letterspacing: 3,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    BigText(
                                      text:
                                      data['httpStats'].end.toString(),
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Icon(
                                  UniconsLine.database,
                                  color: Colors.grey.shade500,
                                  size: 45,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    BigText(
                                      text: "Server :",
                                      fontWeight: FontWeight.w700,
                                      size: 15,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    BigText(
                                      text:
                                      'worldtimeapi.org',
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    BigText(
                                      text: "Bytes sent:",
                                      fontWeight: FontWeight.w700,
                                      size: 15,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    BigText(
                                      text:
                                      '0 B',
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    BigText(
                                      text: "Bytes received :",
                                      fontWeight: FontWeight.w700,
                                      size: 15,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    BigText(
                                      text:
                                          '${data['httpStats'].bytes.toString()} B',
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
