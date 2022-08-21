import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String params;
  String flag;
  String time = '';
  bool isDayTime = false;
  WorldTime({required this.location, required this.params, required this.flag});

  Future<void> getTime() async {
    try {
      var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$params');
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
