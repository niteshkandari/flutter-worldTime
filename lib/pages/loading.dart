import 'package:flutter/material.dart';
import 'package:worldtime_app/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin',
        params: 'Europe/Berlin',
        flag: 'assets/germany.png');

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': instance.flag,
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
