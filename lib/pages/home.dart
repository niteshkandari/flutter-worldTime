import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, "/location");
                          setState(() {
                            data = {
                              'flag': result['flag'],
                              'location': result['location'],
                              'time': result['time'],
                              'isDayTime': result['isDayTime']
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location_alt,
                            color: Colors.grey[300], size: 28),
                        label: Text("location",
                            style: TextStyle(color: Colors.grey[300]))),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: const TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data['time'],
                      style: const TextStyle(
                          fontSize: 60.0,
                          letterSpacing: 2,
                          color: Colors.white),
                    )
                  ],
                ))),
      ),
    );
  }
}
