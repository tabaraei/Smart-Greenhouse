import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://192.168.1.102:8000/';

class Record {
  final double soilMoisture, temperature, humidity;

  Record({this.soilMoisture, this.humidity, this.temperature});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      soilMoisture: json['result'][0]['soil_moisture'],
      temperature: json['result'][0]['temperature'],
      humidity: json['result'][0]['humidity'],
    );
  }

  static getLastNRecord(num) async {
    String finalUrl = url + 'api/environments/list_last_n/';
    var response = await http.post(finalUrl, body: {"number": 1.toString()});
    print(response.body);

    var result = jsonDecode(response.body);

    return Record.fromJson(result);
  }
}

// get
// String finalUrl = url + 'api/environments/2/';
// var response = await http.get(finalUrl);
// Map<String, dynamic> result = jsonDecode(response.body);
