import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://192.168.1.102:8000/';

class Threshold {
  final double threshold;
  Threshold({this.threshold});

  factory Threshold.fromJson(Map<String, dynamic> json) {
    return Threshold(threshold: json['threshold']);
  }

  static getThreshold() async {
    String finalUrl = url + 'api/thresholds/1/';
    var response = await http.get(finalUrl);
    var result = jsonDecode(response.body);
    print(response.body);

    return Threshold.fromJson(result);
  }

  static updateThreshold(newThreshold) async {
    String finalUrl = url + 'api/thresholds/1/';
    var response =
        await http.put(finalUrl, body: {"threshold": newThreshold.toString()});
    var result = jsonDecode(response.body);
    print(response.body);

    return Threshold.fromJson(result);
  }
}
