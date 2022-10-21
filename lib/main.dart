import 'package:cargo/ui/chat/ibchat.dart';
import 'package:cargo/ui/home.dart';
import 'package:cargo/ui/login_ui/login.dart';
import 'package:cargo/ui/profile/profile.dart';
import 'package:cargo/ui/register/register1.dart';
import 'package:cargo/ui/register/register2.dart';
import 'package:cargo/ui/spash_screen/splash_screen.dart';
import 'package:cargo/ui/verification/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MySplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
