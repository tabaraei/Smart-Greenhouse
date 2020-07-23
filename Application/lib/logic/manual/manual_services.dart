import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://192.168.1.102:8000/';

class Toggle {
  final bool toggle;
  final String title;
  Toggle({this.toggle, this.title});

  factory Toggle.fromJson(Map<String, dynamic> json) {
    if (json['toggle'] == false) {
      return Toggle(toggle: false, title: 'شروع');
    } else {
      return Toggle(toggle: true, title: 'توقف');
    }
  }

  static updateToggle(status) async {
    String finalUrl = url + 'api/toggles/1/';
    var response =
        await http.put(finalUrl, body: {"toggle": status.toString()});
    print(response.body);
    var result = jsonDecode(response.body);

    return Toggle.fromJson(result);
  }
}
