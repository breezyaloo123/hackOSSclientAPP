import 'package:appclient/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

class PayCash extends StatefulWidget {
  const PayCash({Key? key}) : super(key: key);

  @override
  _PayCashState createState() => _PayCashState();
}

class _PayCashState extends State<PayCash> {
  // Operateurs operateurs = new Operateurs(nom: "Orange", image: "")
  AuthService authService = new AuthService();

  TextEditingController tel = new TextEditingController();
  TextEditingController code = new TextEditingController();
  String token = globals.token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acheter du credit'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          children: [
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.only(right: 10, top: 20,left: 70),
                  child: SvgPicture.asset(
                    "assets/orange.svg",
                    width: 100,
                    height: 100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(right: 10, top: 20),
                  child: Image.asset(
                    "assets/logo_free.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/logo_expresso.png",
                    width: 100,
                    height: 100,
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
                            token =
                                sharedPreferences.getString("token").toString();
                            var response = await http.post(
                                Uri.parse(
                                    "http://192.168.1.22:3001/api/v1/credit"),
                                headers: {
                                  
                                  'Authorization': 'Bearer $token'
                                },
                                body: {
                                  "tel": tel.text,
                                  "montan": code.text,
                                  "operateur": "ORANGE"
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
      ]),
    );
  }
}

class Operateurs {
  String nom;
  String image;
  Operateurs({required this.nom, required this.image});
}
