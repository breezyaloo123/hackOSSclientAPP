import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CashIN extends StatefulWidget {
  const CashIN({Key? key}) : super(key: key);

  @override
  _CashINState createState() => _CashINState();
}

class _CashINState extends State<CashIN> {
  TextEditingController tel = new TextEditingController();
  TextEditingController code = new TextEditingController();
  var token = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Depot"),
        centerTitle:true),
        body: ListView(children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    margin: EdgeInsets.only(right: 10, top: 20, left: 60),
                    child: Image.asset(
                      "assets/om.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(right: 10, top: 20),
                    child: Image.asset(
                      "assets/freemoney_logo.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/emoney_logo.png",
                      width: 90,
                      height: 90,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  Container(
                    width: 325,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: 250,
                          child: TextField(
                            controller: tel,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Entrer le Numero',
                              suffixIcon: Icon(FontAwesomeIcons.phone),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: TextField(
                            controller: code,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Entrer la somme',
                              suffixIcon: Icon(FontAwesomeIcons.moneyCheck),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              token = sharedPreferences
                                  .getString("token")
                                  .toString();
                              var response = await http.post(
                                  Uri.parse(
                                      "http://192.168.1.22:3001/api/v1/depot"),
                                  headers: {
                                    'Authorization': 'Bearer $token'
                                  },
                                  body: {
                                    "tel": tel.text,
                                    "montan": code.text,
                                    "operateur": "ORANGE MONEY"
                                  });

                              print(response.body);
                              print(tel.text);
                              print(code.text);
                            },
                            child: Text('Acheter'))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
