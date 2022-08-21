import 'package:flutter/material.dart';
import 'package:worldtime_app/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(params: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(params: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(params: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(params: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(params: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        params: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(params: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(params: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(params: 'Asia/Tokyo', location: 'Japan', flag: 'japan.png'),
    WorldTime(
        params: 'America/Toronto', location: 'Canada', flag: 'canada.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    Navigator.pop(context, {
      'flag': instance.flag,
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
