import 'package:flutter/material.dart';

navProfileBar() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
              Colors.purple,
              Colors.redAccent.shade100,
            ])),
      ),

      //lest first circle
      Padding(
        padding: const EdgeInsets.only(bottom: 50.0, right: 200),
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ),
      //left second circle
      Padding(
        padding: const EdgeInsets.only(top: 120, right: 220),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ),
      //right second circle

      Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 255),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ),
      //right third circle

      Padding(
        padding: const EdgeInsets.only(top: 160.0, left: 255),
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ),
      //right first circle
      Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 200),
        child: Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ),
      //Profil
      Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: Container(
          child: Text(
            "Profil",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      //profilePicture
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.blueGrey.shade200,
            image: DecorationImage(
                image: AssetImage("assets/images/bsm.png"), fit: BoxFit.cover)),
      ),
      //camera
      Padding(
        padding: const EdgeInsets.only(left: 75.0, top: 45),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.white, width: 1),
              color: Colors.blueGrey.shade200),
          child: Icon(
            Icons.camera_alt_outlined,
            size: 15,
          ),
        ),
      ),

      //Username
      Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Container(
          child: Text(
            "BSM",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      //Email
      Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Container(
          child: Text(
            "malachieborohoul@gmail.com",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
        ),
      )
    ],
  );
}

navChatBar() {
  return Container(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(right: 150.0, top: 15),
      child: Text(
        "Messages",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

navIbChatBar() {
  return Container(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(right: 150.0, top: 15),
      child: Text(
        "Stark",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
