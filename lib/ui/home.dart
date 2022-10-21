import 'package:cargo/ui/accueil/accueil.dart';
import 'package:cargo/ui/chat/chat.dart';
import 'package:cargo/ui/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 48.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
            color: Colors.white,
          ),
          Icon(Icons.navigation, size: 25, color: Colors.white),
          Icon(Icons.chat, size: 25, color: Colors.white),
          Icon(Icons.perm_identity, size: 25, color: Colors.white),
          // Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.purple,
        buttonBackgroundColor: Colors.purple,
        // backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _page == 0
          ? Container(
              child: Accueil(),
            )
          : _page == 1
              ? Container(color: Colors.white)
              : _page == 2
                  ? Container(
                      child: Chat(),
                    )
                  : _page == 3
                      ? Container(
                          child: Chat(),
                        )
                      : Container(
                          child: Profile(),
                        ),
    );
  }
}
