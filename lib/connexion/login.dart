import 'package:appclient/connexion/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Page'),
      ),
      body: ListView(
        children:<Widget>[ Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Color(0xFF8A2387),
              Color(0xFFE94057),
              Color(0xFFF27121)
            ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15,),
              SvgPicture.asset('assets/login.svg',
              semanticsLabel: 'Login Picture',
              height: 180,
              alignment: Alignment.center,
              width: 180,),
              SizedBox(height: 15,),
              Container(
                height: 450,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text('Welcome',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 15,),
                    Text('Please log in your Account',
                    
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    
                    ),),
                    SizedBox(height: 15,),
                    Container(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Entrer le Telephone',
                          suffixIcon: Icon(FontAwesomeIcons.phone),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Entrer le code',
                          
                          suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 40,),

                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                               Color(0xFF8A2387),
                              Color(0xFFE94057),
                             Color(0xFFF27121)
                        ]),
                                                
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Login'),

                        ),
                      ),
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
                    )


                  ],
                ),
              ),
        ]
      ),),]),
    );
  }
}
