import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const API_URL = "http://192.168.1.22:3001/api/v1/login";
  var prefs = null;

  Future<SharedPreferences> getShared() async {
    if (prefs != null) {
      return prefs;
    }
    return prefs = await SharedPreferences.getInstance();
  }

  static final url = Uri.parse(API_URL);

  Future<String> login(tel, codeSecret) async {
    String profile = '';
    try {
      var response =
          await http.post(url, body: {"tel": tel, "codeSecret": codeSecret});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var prsf = await getShared();
        prsf.setString('token', data['token']);
        print(data['token']);
      }
    } catch (e) {
      print(e);
    }
    return profile;
  }

  Future<String?> getTokenFromShared() async {
    var prsf = await getShared();
    return prsf.getString('token');
  }

}
