import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.blueGrey.shade200,
                          image: DecorationImage(
                              image: AssetImage("assets/images/bsm.png"),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      "Cargo",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.messenger_rounded,
                            color: Colors.purple,
                          ),
                        ),
                        Icon(
                          Icons.notifications_sharp,
                          color: Colors.purple,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _annonce(),
                    _annonce(),
                    _annonce(),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.48,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/google_map.jpeg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _annonce() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
