import 'package:cargo/ui/chat/ibchat.dart';
import 'package:cargo/utilitaire/navBar.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          flexibleSpace: navChatBar()),
      body: Container(
        // width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.grey.shade200,
        child: ListView(
          children: [
            Column(
              children: [
                _chat(),
                _chat(),
                _chat(),
                _chat(),
                _chat(),
                _chat(),
                _chat(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _chat() {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 18),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                color: Colors.grey.shade300,
                image: DecorationImage(
                    image: AssetImage("assets/images/bsm.png"),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 100),
          child: Container(
            child: Text(
              "Stark",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38.0, left: 235),
          child: Container(
            child: Text(
              "15 min",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 100),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IbChat();
                }));
              },
              child: Flexible(
                  child: Text(
                "Lorem Lorem Lorfvhhhhhhhhhhhhem LoremLoremLorem Lorem",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
