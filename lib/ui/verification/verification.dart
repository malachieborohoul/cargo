import 'package:cargo/ui/home.dart';
import 'package:cargo/ui/login_ui/login.dart';
import 'package:cargo/utilitaire/border.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _iconBack(),
                _title(),
                _codeVerification(),
                _VerificationButton(),
              ],
            ),
          ),
        ));
  }

  _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Text(
        "Vérification",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _codeVerification() {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          onChanged: null,
          decoration: InputDecoration(
              hintText: "Code de 6 caractères",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _VerificationButton() {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Verification2();
              // }));
            },
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return BottomNavBar();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25), right: Radius.circular(25))),
                child: Text(
                  "Commençons",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )));
  }

  _iconBack() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, right: 270),
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_sharp)),
    );
  }
}
