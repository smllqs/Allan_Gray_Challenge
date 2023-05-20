import 'package:app_load_testing_ag/services/world_time_data.dart';
import 'package:app_load_testing_ag/widgets/big_text.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTimeData> locations = [
    WorldTimeData(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'south_africa.png'),
    WorldTimeData(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeData(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeData(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeData(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeData(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeData(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeData(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeData(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];



  // Build Function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: BigText(text : 'Choose a Location', color: Colors.grey.shade300,),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () async{
                    await locations[index].getTime();
                    if (context.mounted){
                      Navigator.pop(context, {
                        'time' : locations[index].time,
                        'location' : locations[index].location,
                        'flag' : locations[index].flag,
                        'isDaytime' : locations[index].isDaytime,
                        'httpStats' : locations[index].httpStats
                      });
                    }else{
                      Navigator.of(context).pop();
                    }

                  },
                  title: Text(locations[index].location) ,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
