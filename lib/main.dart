import 'package:appclient/connexion/login.dart';
import 'package:appclient/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.purple
    ),
    home: FirstPage(),
  ));
}




































































































