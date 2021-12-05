import 'package:appclient/achetercredit.dart';
import 'package:appclient/depot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Action action = new Action(
      nom: "Acheter", secondnom: "credit", image: "assets/credit.svg");
  Action Action1 = new Action(
      nom: "Transferer",
      secondnom: "Argent,credit",
      image: "assets/transfert.svg");
  Action Action2 = new Action(
      nom: "Historique", secondnom: "transactions", image: "assets/historic.svg");
  Action Action3 =
      new Action(nom: "Avoir", secondnom: "solde", image: "assets/solde.svg");
  @override
  Widget build(BuildContext context) {
    List<Action> list = [action, Action1, Action2, Action3];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          actions: [Icon(Icons.settings)],
          title: Text(
            "Alassane Sall",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            padding: EdgeInsets.only(left: 16, right: 16),
            children: list.map((data) {
              return GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(
                          data.image,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.nom,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.secondnom,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print(list.indexOf(data));
                    int index = list.indexOf(data);
                    switch (index) {
                      case 0:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PayCash()));
                        break;
                      case 1:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CashIN()));
                        break;
                      case 2:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PayCash()));
                        break;
                      case 3:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PayCash()));
                        break;
                      default:
                        {
                          print("object");
                        }
                    }
                    // if (list.indexOf(data) == 0) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => PayCash()));
                    // }
                  });
            }).toList(),
          ),
        ));
  }
}

class Action {
  String nom;
  String secondnom;
  String image;
  Action({required this.nom, required this.secondnom, required this.image});
}
