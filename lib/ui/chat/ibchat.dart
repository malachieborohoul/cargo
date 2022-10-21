import 'package:cargo/utilitaire/navBar.dart';
import 'package:flutter/material.dart';

class IbChat extends StatefulWidget {
  @override
  State<IbChat> createState() => _IbChatState();
}

class _IbChatState extends State<IbChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          "Stark",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
          // color: Colors.amber,
          child: ListView(
            children: [
              
              Column(
                children: [
                  _recepteur(), 
                  _envoyeur(),
                  _recepteur(), 
                  _envoyeur(),
                  _envoyeur(),



                  ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.95,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(30))
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Message",
            ),
          ),
        ),
        Icon(Icons.send)
          ],
        ),
      ),
    );
  }

  _recepteur() {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Padding(
            padding: const EdgeInsets.only(top:35.0),
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: AssetImage("assets/images/bsm.png"),
                        fit: BoxFit.cover)
                    
                        ),
                        
              ),
          ),
            Column(
              children: [
                Container(
                    alignment: Alignment.center,

                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(45), bottomRight: Radius.circular(45),topLeft: Radius.circular(30))
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child:Flexible(
                          child: Text("On dit quoi quoi quoi quoi  quoi quoi quoi quoi quoi  quoi quoi quoi quoi quoi quoi quoi quoi ?", style: TextStyle(color: Colors.grey.shade700),)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 25,
                    child: Text("12:10", style: TextStyle(color: Colors.grey),),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  _envoyeur() {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

        children: [
         
            Column(
              
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(45),topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                   child:Flexible(
                          child: Text("On dit quoi quoi quoi ??", style: TextStyle(color: Colors.white),)),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:10.0,left: 180 ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 25,
                    child: Text("12:10", style: TextStyle(color: Colors.grey),),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
