import 'dart:async';

import 'package:cargo/ui/accueil/accueil.dart';
import 'package:cargo/ui/global/global.dart';
import 'package:cargo/ui/home.dart';
import 'package:cargo/ui/login_ui/login.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if(fAuth.currentUser!= null){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BottomNavBar();
      }));
      }else{
         Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
      }
     
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
        Text(
          "CARGO",
          style: TextStyle(fontSize: 50, color: Colors.purple),
        ),
        CircularProgressIndicator(color: Colors.purple,)
        
          ],
        ),
      ),
    );
  }
}
