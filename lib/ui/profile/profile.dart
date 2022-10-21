import 'dart:ui';

import 'package:cargo/ui/global/global.dart';
import 'package:cargo/ui/spash_screen/splash_screen.dart';
import 'package:cargo/utilitaire/navBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 230, flexibleSpace: navProfileBar()),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            // height: 150,
            color: Colors.transparent,
            child: ListView(
              children: [
                _username(),
                _password(),
                _bio(),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ),
                _setting(),
                _driver(), 
                _parametreNotif(),
                _apropos(),
                _logout()
              ],
            ),
          ),
        ));
  }

  _username() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nom complet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "BSM",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _password() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mot de passe",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "***********",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _bio() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Biographie",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Musique, Cinema",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _setting() {
    return Row(
      children: [
        Icon(Icons.settings_sharp, size: 30,), 
        SizedBox(width: 15,),
        Text(
                "Paramètres",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ],
    );
  }

  _driver() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Je suis chauffeur",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35))

                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:37.0, top:3),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)

                      ),
                    ),
                  )
                ],
              )
            ],
          ),
         
        ],
      ),
    );
  }

  _apropos() {
     return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "A propos",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey),
              ),
             Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey,)
            ],
          ),
         
        ],
      ),
    );
  }

  _parametreNotif() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Paramètres notification",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey),
              ),
             Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey,)
            ],
          ),
         
        ],
      ),
    );
  }

  _logout() {
     return Padding(
       padding: const EdgeInsets.only(top:25.0),
       child: InkWell(
         onTap: () {
              fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c) => MySplashScreen()));
         },
         child: Row(
          children: [
            Icon(Icons.logout_outlined, size: 40,), 
            SizedBox(width: 15,),
            Text(
                    "Se déconnecter",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
          ],
           ),
       ),
     );
  }
}
