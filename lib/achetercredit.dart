import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayCash extends StatefulWidget {
  const PayCash({Key? key}) : super(key: key);

  @override
  _PayCashState createState() => _PayCashState();
}

class _PayCashState extends State<PayCash> {
  // Operateurs operateurs = new Operateurs(nom: "Orange", image: "")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acheter du credit'),
        centerTitle: true,
      ),
    );
  }
}

class Operateurs {
  String nom;
  String image;
  Operateurs({required this.nom, required this.image});
}
