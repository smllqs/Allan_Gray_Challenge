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
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 170.0, 0.0, 0.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20)),
                  height: 390,
                  width: 350,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: Column(
                      children: <Widget>[
                        BigText(
                          text: 'Http Statistics',
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w500,
                          letterspacing: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Divider(
                            height: 12,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                                  size: 50,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,
                                  children: [
                                    BigText(
                                      text: "Response time :",
                                      fontWeight: FontWeight.w700,
                                      size: 15,
                                      color: Colors.grey.shade500,
                                    ),
                                    const SizedBox(width: 15,),
                                    BigText(
                                      text:
                                          "${data['httpStats'].duration.toString()} ms",
                                      size: 15,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                Icon(
                                  Icons.ad_units,
                                  color: Colors.grey.shade500,
                                  size: 50,
                                )
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
